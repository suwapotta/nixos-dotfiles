{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    modules.core.system.kernel-zen.enable = lib.mkEnableOption "zen kernel";
  };

  config = lib.mkIf config.modules.core.system.kernel-zen.enable {
    boot.kernelPackages = pkgs.linuxPackages_zen;
  };
}
