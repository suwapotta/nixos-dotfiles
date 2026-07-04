{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.amd-gpu.enable = lib.mkEnableOption "AMD GPU Extra drivers/utils";
  };

  config = lib.mkIf config.modules.core.amd-gpu.enable {
    hardware.amdgpu = {
      initrd.enable = true;

      # Optional
      # zluda.enable = true;
      # opencl.enable = true;
    };

    # Linux MSI Afterburner
    services.lact.enable = true;

    services.xserver.videoDrivers = [ "amdgpu" ];
  };
}
