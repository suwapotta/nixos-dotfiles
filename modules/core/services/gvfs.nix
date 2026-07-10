{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.services.gvfs.enable = lib.mkEnableOption "virtual fs (i.e. USBs, Trash, etc.)";
  };

  config = lib.mkIf config.modules.core.services.gvfs.enable {
    services.gvfs.enable = true;
  };
}
