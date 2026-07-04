{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.ly.enable = lib.mkEnableOption "ly - tui login manager";
  };

  config = lib.mkIf config.modules.core.ly.enable {
    services.displayManager.ly = {
      enable = true;

      # NOTE: Docs: https://github.com/fairyglade/ly/blob/master/res/config.ini
      settings = {
        animation = "colormix";

        asterisk = "null";
        clear_password = true;

        vi_mode = true;
        vi_default_mode = "normal";

        show_tty = true;
      };
    };
  };
}
