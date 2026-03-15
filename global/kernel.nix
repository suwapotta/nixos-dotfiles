{ pkgs, config, ... }:

# Target the latest zen kernel with msi-ec
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
}
