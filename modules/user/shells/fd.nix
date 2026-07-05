{
  lib,
  config,
  ...
}:

{
  options = {
    modules.user.shells.fd.enable = lib.mkEnableOption "fd - find replacement";
  };

  config = lib.mkIf config.modules.user.shells.fd.enable {
    programs.fd.enable = true;
  };
}
