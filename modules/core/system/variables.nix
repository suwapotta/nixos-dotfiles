{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.system.variables.enable = lib.mkEnableOption "global variables (wayland)";
  };

  config = lib.mkIf config.modules.core.system.variables.enable {
    environment.sessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
