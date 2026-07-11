{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.hardware.nvidia-sync.enable =
      lib.mkEnableOption "uses nvidia GPU entirely (override offload)";
  };

  config = lib.mkIf config.modules.core.hardware.nvidia-sync.enable {
    # NOTE: Specs:
    # $ nix-shell -p pciutils --run "lspci | grep 'VGA\|3D'"
    #   00:02.0 VGA compatible controller: Intel Corporation TigerLake-H GT1 [UHD Graphics] (rev 01)
    #   01:00.0 3D controller: NVIDIA Corporation GA107M [GeForce RTX 3050 Ti Mobile] (rev a1)

    modules.core.system._unfree-pkgs.list = [
      "nvidia-x11"
      "nvidia-settings"
      "nvidia-kernel-modules"
    ];
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      open = false;
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = false;

      prime = {
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";

        sync.enable = true;
        offload = {
          enable = false;
          enableOffloadCmd = false;
        };
      };
    };

    # WARN: Add nvidia va-api later
    environment = {
      sessionVariables = {
        LIBVA_DRIVER_NAME = lib.mkForce "nvidia";
        GBM_BACKEND = "nvidia-drm";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";

        # NVD_BACKEND = "direct";
      };
    };
  };
}
