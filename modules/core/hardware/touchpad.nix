{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.hardware.touchpad.enable = lib.mkEnableOption "touchpad support";
  };

  config = lib.mkIf config.modules.core.hardware.touchpad.enable {
    services.libinput.enable = true;
  };
}
