{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.services.power.enable = lib.mkEnableOption "power daemons";
  };

  config = lib.mkIf config.modules.core.services.power.enable {
    services = {
      power-profiles-daemon.enable = true;
      upower.enable = true;
    };
  };
}
