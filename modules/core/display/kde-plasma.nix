{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.display.kde-plasma.enable = lib.mkEnableOption "kde plasma - desktop environment";
  };

  config = lib.mkIf config.modules.core.display.kde-plasma.enable {
    services = {
      desktopManager.plasma6.enable = true;
      displayManager.plasma-login-manager.enable = true;
      # xserver.enable = true;
    };
  };
}
