{
  flake.nixosModules."zen-kernel" =
    { pkgs, config, ... }:

    {
      boot = {
        kernelPackages = pkgs.linuxPackages_zen;

        extraModulePackages = [ config.boot.kernelPackages.msi-ec ];
        kernelModules = [
          "msi-ec"
          "ec_sys"
        ];

        kernelParams = [
          "hid_apple.fnmode=2"
        ];
      };
    };
}
