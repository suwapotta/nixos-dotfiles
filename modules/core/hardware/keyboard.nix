{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.hardware.keyboard.enable = lib.mkEnableOption "wireless keyboard fix";
  };

  config = lib.mkIf config.modules.core.hardware.keyboard.enable {
    boot.kernelParams = [ "hid_apple.fnmode=2" ];
  };
}
