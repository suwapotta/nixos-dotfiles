{
  config,
  lib,
  ...
}:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";

  # Standard .config/ directories
  configs = [
    # "niri"
    "kitty"
    "fish"
    "fastfetch"
    "yazi"
    "nvim"
    "btop"
    "cava"
    "zathura"
    "starship.toml"
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
    ./apps
    ./cli
    ./desktop
    ./editors
    ./shell
    ./terminals
  ];
}
