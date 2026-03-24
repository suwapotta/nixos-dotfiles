{ self, inputs, ... }:

{
  flake.nixosModules."home-manager" =
    { lib, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs self; };
        backupFileExtension = "bak";

        users."suwapotta" =
          { config, ... }:
          let
            dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";

            # Standard .config/ directories
            configs = [
              "niri"
              "yazi"
              "nvim"
              "btop"
              "cava"
              "zathura"
            ];
          in
          {
            home = {
              username = "suwapotta";
              homeDirectory = "/home/suwapotta";
              stateVersion = "25.11";
            };

            # Interates to make-out-of-store symlink from existing dotfiles
            xdg.configFile = lib.genAttrs configs (name: {
              source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${name}";
              recursive = true;
            });

            imports = [
              # apps
              self.homeModules."anki"
              self.homeModules."zen-beta"

              # cli
              self.homeModules."bat"
              self.homeModules."fastfetch"
              self.homeModules."fzf"
              self.homeModules."lazygit"
              self.homeModules."tealdeer"
              self.homeModules."tmux"

              # desktop
              self.homeModules."cursor"
              self.homeModules."fcitx5"
              self.homeModules."gtk"
              self.homeModules."niri-flake"
              self.homeModules."noctalia"
              self.homeModules."qt"
              self.homeModules."user-dirs"

              # editors
              self.homeModules."neovim"

              # shells
              self.homeModules."eza"
              self.homeModules."fish"
              self.homeModules."starship"
              self.homeModules."zoxide"

              # terminals
              self.homeModules."kitty"

              # Catppuccin theme
              self.homeModules."catppuccin"
              inputs.catppuccin.homeModules.catppuccin
            ];
          };
      };
    };
}
