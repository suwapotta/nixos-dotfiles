{
  config,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  # Standard .config/ directories
  configs = {
    niri = "niri";
    kitty = "kitty";
    fish = "fish";
    fastfetch = "fastfetch";
    yazi = "yazi";
    "gtk-3.0" = "gtk-3.0";
    "gtk-4.0" = "gtk-4.0";
    qt5ct = "qt5ct";
    qt6ct = "qt6ct";
    fcitx5 = "fcitx5";
    "starship.toml" = "starship.toml";
    cava = "cava";
    btop = "btop";
    zathura = "zathura";
    nvim = "nvim";
  };
in

{
  home = {
    username = "suwapotta";
    homeDirectory = "/home/suwapotta";
    stateVersion = "25.11";
  };

  # Interates to make-out-of-store symlink from existing dotfiles
  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  # Custom settings
  imports = [
    ./tmux.nix
    ./tealdeer.nix
    ./nvim.nix
  ];
}
