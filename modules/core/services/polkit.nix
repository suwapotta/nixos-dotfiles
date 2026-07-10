{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.services.polkit.enable = lib.mkEnableOption "soteria polkit";
  };

  config = lib.mkIf config.modules.core.services.polkit.enable {
    security.soteria.enable = true;
  };
}
