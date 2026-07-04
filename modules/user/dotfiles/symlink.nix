{
  lib,
  config,
  ...
}:

let
  # Target standard ~/.config/ directories
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  configs = [
    "lvim"
    "niri"
    "nvim"
  ];
in
{
  options = {
    modules.user.dotfiles.symlink.enable = lib.mkEnableOption "enables Out-Of-Store-Symlink";
  };

  config = lib.mkIf config.modules.user.dotfiles.symlink.enable {
    # Interates to make-out-of-store symlink from existing dotfiles
    xdg.configFile = lib.genAttrs configs (name: {
      source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/${name}";
      recursive = true;
    });
  };
}
