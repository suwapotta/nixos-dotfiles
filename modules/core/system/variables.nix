{
  lib,
  config,
  ...
}:

let
  lvim = "env NVIM_APPNAME=lvim nvim";
in
{
  options = {
    modules.core.system.variables.enable = lib.mkEnableOption "global variables (wayland)";
  };

  config = lib.mkIf config.modules.core.system.variables.enable {
    environment = {
      # defaultEditor -> lvim
      variables = {
        EDITOR = lvim;
        VISUAL = lvim;
      };

      sessionVariables = {
        # fcitx5
        XMODIFIERS = "@im=fcitx";
        GLFW_IM_MODULE = "ibus";

        # wayland
        MOZ_ENABLE_WAYLAND = "1";
      };
    };
  };
}
