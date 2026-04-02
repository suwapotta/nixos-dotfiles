{
  flake.nixosModules."nvidia" =
    # NOTE: Specs:
    # $ nix-shell -p pciutils --run "lspci | grep 'VGA\|3D'"
    #   00:02.0 VGA compatible controller: Intel Corporation TigerLake-H GT1 [UHD Graphics] (rev 01)
    #   01:00.0 3D controller: NVIDIA Corporation GA107M [GeForce RTX 3050 Ti Mobile] (rev a1)
    { lib, ... }:

    {
      nixpkgs.config.allowUnfreePredicate =
        pkg:
        builtins.elem (lib.getName pkg) [
          "nvidia-x11"
          "nvidia-settings"
        ];
      services.xserver.videoDrivers = [ "nvidia" ];

      hardware = {
        nvidia = {
          modesetting.enable = true;
          powerManagement.enable = true;
          powerManagement.finegrained = true;
          open = false;
        };

        nvidia.prime = {
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };

          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
        };
      };
    };
}
