{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.hardware.msi.enable = lib.mkEnableOption "msi laptop specific settings";
  };

  config = lib.mkIf config.modules.core.hardware.msi.enable {
    boot.kernelParams = [
      # Power consumption in case of NVME SSD was installed
      "nvme.noacpi=1"

      # Fixing interferences with Fn- action keys
      "video.report_key_events=0"
    ];
  };
}
