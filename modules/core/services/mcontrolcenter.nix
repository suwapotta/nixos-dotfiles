{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    modules.core.services.mcontrolcenter.enable = lib.mkEnableOption "Linux MSI Control Center";
  };

  config = lib.mkIf config.modules.core.services.mcontrolcenter.enable {
    environment.systemPackages = with pkgs; [
      mcontrolcenter
    ];

    boot = {
      kernelModules = [
        "msi-ec"
        "ec_sys"
      ];

      extraModulePackages = [ config.boot.kernelPackages.msi-ec ];
    };
  };
}
