{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.hardware.bluetooth.enable = lib.mkEnableOption "bluetooth service";
  };

  config = lib.mkIf config.modules.core.hardware.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };

}
