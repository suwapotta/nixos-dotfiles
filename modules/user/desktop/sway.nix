{
  lib,
  config,
  ...
}:

let
  terminal = "alacritty";
  browser = "librewolf";
  mod = "Mod4";
in
{
  options = {
    modules.user.desktop.sway.enable = lib.mkEnableOption "i3-compatible tiling Wayland compositor";
  };

  config = lib.mkIf config.modules.user.desktop.sway.enable {
    wayland.windowManager.sway = {
      enable = true;

      config = {
        modifier = mod;
        inherit terminal;

        output = {
          "DP-1" = {
            mode = "1440x900@75.003Hz";
          };
        };

        seat = {
          "*" = {
            hide_cursor = "when-typing enable";
          };
        };

        gaps = {
          inner = 5;
          outer = 5;
        };

        window = {
          border = 3;
          titlebar = false;
        };

        startup = [
          { command = terminal; }
        ];

        keybindings = lib.mkOptionDefault {
          # Applications
          "${mod}+Return" = "exec ${terminal}";
          "${mod}+b" = "exec ${browser}";

          # Window manipulation
          "${mod}+q" = "kill";
          "${mod}+Shift+f" = "fullscreen toggle";
          "${mod}+a" = "floating toggle";
        };
      };
    };
  };
}
