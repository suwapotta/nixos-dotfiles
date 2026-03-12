{
  config,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  createSymlink = path: config.lib.file.mkOutOfStoreSymlink path;
  # Standard .config/ directories
  configs = {
    niri = "niri";
    kitty = "kitty";
    fish = "fish";
    fastfetch = "fastfetch";
    yazi = "yazi";
    nvim = "nvim";
    btop = "btop";
    cava = "cava";
    zathura = "zathura";
    "starship.toml" = "starship.toml";
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
    source = createSymlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  imports = [
    ./apps
    ./cli
    ./desktop
    ./editors
    ./shell
    ./terminals
  ];
}
