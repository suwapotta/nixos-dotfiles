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
    "starship.toml" = "starship.toml";
    "gtk-3.0" = "gtk-3.0";
    "gtk-4.0" = "gtk-4.0";
    qt5ct = "qt5ct";
    qt6ct = "qt6ct";
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
    source = createSymlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  # NOTE: WIP...
  imports = [
    ./apps
    ./cli
    ./desktop
    ./editors
    ./shell
    ./terminals
  ];
}
