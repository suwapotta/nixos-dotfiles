{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    modules.user.desktop.cursor.enable = lib.mkEnableOption "bibata modern cursor";
  };

  config = lib.mkIf config.modules.user.desktop.cursor.enable {
    home.pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;

      gtk.enable = true;
      x11.enable = true;
    };
  };
}
