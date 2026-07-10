{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.system.systemd-boot.enable = lib.mkEnableOption "systemd boot loader";
  };

  config = lib.mkIf config.modules.core.system.systemd-boot.enable {
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
