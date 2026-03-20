{
  inputs,
  lib,
  pkgs,
  config,
  ...
}:

{
  imports = [
    inputs.niri-flake.homeModules.niri
  ];

  home = {
    sessionVariables.NIXOS_OZONE_WL = 1;

    packages = with pkgs; [
      xwayland-satellite
      wl-clipboard
      libsecret
    ];
  };

  programs.niri = {
    enable = true;

    package = pkgs.niri;
    # package = pkgs.niri-stable;
    # package = pkgs.niri-stable;

    settings = {
      # https://yalter.github.io/niri/Configuration:-Miscellaneous
      spawn-at-startup = [
        { sh = "fcitx5 -r"; }
        { sh = "noctalia-shell"; }
        { sh = "mcontrolcenter"; }
      ];

      prefer-no-csd = true;

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      environment = {
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
      };

      cursor = {
        hide-when-typing = true;
        hide-after-inactive-ms = 5000;
      };

      overview.zoom = 0.5;

      xwayland-satellite.path = "${lib.getExe pkgs.xwayland-satellite}";

      hotkey-overlay.skip-at-startup = true;

      # https://yalter.github.io/niri/Configuration:-Input
      input = {
        keyboard = {
          xkb.layout = "en";

          # options "grp:win_space_toggle,compose:ralt,escape:nocaps"
          # options "caps:escape"

          # Option: global/window
          track-layout = "window";

          repeat-delay = 250;
          repeat-rate = 35;

          # numlock
        };

        touchpad = {
          tap = true;
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          disabled-on-external-mouse = true;
        };

        mouse.accel-profile = "flat";

        trackpoint.natural-scroll = true;

        warp-mouse-to-focus.mode = "center-xy";
        focus-follows-mouse.max-scroll-amount = "0%";
        workspace-auto-back-and-forth = true;
      };

      # https://yalter.github.io/niri/Configuration:-Key-Bindings
      binds = {
        "Mod+Return" = {
          hotkey-overlay.title = "Open Terminal";
          action.spawn = "kitty";
        };
        "Mod+Shift+Return" = {
          hotkey-overlay.title = "Open floating Terminal";
          action.spawn-sh = "kitty --class=floating.kitty";
        };
        "Mod+B" = {
          hotkey-overlay.title = "Open Zen Browser";
          action.spawn = "zen-beta";
        };
        "Mod+Z" = {
          hotkey-overlay.title = "Open Anki";
          action.spawn = "anki";
        };
        "Mod+Shift+E" = {
          hotkey-overlay.title = "Open files";
          action.spawn = "nautilus";
        };
        "Mod+E" = {
          hotkey-overlay.title = "Open yazi";
          action.spawn-sh = "kitty -e yazi";
        };
        "Control+Shift+Escape" = {
          hotkey-overlay.title = "Open btop++";
          action.spawn-sh = "kitty -e --class=floating.btop btop";
        };

        # Core Navigations
        "Mod+MouseBack" = {
          repeat = false;
          action.focus-workspace-down = [ ];
        };
        "Mod+MouseForward" = {
          repeat = false;
          action.focus-workspace-up = [ ];
        };

        "Mod+O" = {
          repeat = false;
          action.toggle-overview = [ ];
        };
        "Mod+Q" = {
          repeat = false;
          action.close-window = [ ];
        };

        # Focus
        "Mod+Left".action.focus-column-left = [ ];
        "Mod+Down".action.focus-window-down = [ ];
        "Mod+Up".action.focus-window-up = [ ];
        "Mod+Right".action.focus-column-right = [ ];
        "Mod+H".action.focus-column-left = [ ];
        "Mod+J".action.focus-window-down = [ ];
        "Mod+K".action.focus-window-up = [ ];
        "Mod+L".action.focus-column-right = [ ];

        # Move Window/Column
        "Mod+Shift+Left".action.move-column-left = [ ];
        "Mod+Shift+Down".action.move-window-down = [ ];
        "Mod+Shift+Up".action.move-window-up = [ ];
        "Mod+Shift+Right".action.move-column-right = [ ];
        "Mod+Shift+H".action.move-column-left = [ ];
        "Mod+Shift+J".action.move-window-down = [ ];
        "Mod+Shift+K".action.move-window-up = [ ];
        "Mod+Shift+L".action.move-column-right = [ ];

        # Move to First/Last
        "Mod+Alt+H".action.focus-column-first = [ ];
        "Mod+Alt+L".action.focus-column-last = [ ];
        "Mod+Alt+Shift+H".action.move-column-to-first = [ ];
        "Mod+Alt+Shift+L".action.move-column-to-last = [ ];

        # Monitor Focus
        # "Mod+Ctrl+Left".action.focus-monitor-left = [ ];
        # "Mod+Ctrl+Down".action.focus-monitor-down = [ ];
        # "Mod+Ctrl+Up".action.focus-monitor-up = [ ];
        # "Mod+Ctrl+Right".action.focus-monitor-right = [ ];
        # "Mod+Ctrl+H".action.focus-monitor-left = [ ];
        # "Mod+Ctrl+J".action.focus-monitor-down = [ ];
        # "Mod+Ctrl+K".action.focus-monitor-up = [ ];
        # "Mod+Ctrl+L".action.focus-monitor-right = [ ];
        # "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = [];
        # "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = [];
        # "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = [];
        # "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = [];
        # "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = [];
        # "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = [];
        # "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = [];
        # "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = [];

        # Workspace Focus/Move
        "Mod+Page_Down".action.focus-workspace-down = [ ];
        "Mod+Page_Up".action.focus-workspace-up = [ ];
        "Mod+U".action.focus-workspace-down = [ ];
        "Mod+I".action.focus-workspace-up = [ ];
        "Mod+Shift+Page_Down".action.move-column-to-workspace-down = [ ];
        "Mod+Shift+Page_Up".action.move-column-to-workspace-up = [ ];
        "Mod+Shift+U".action.move-column-to-workspace-down = [ ];
        "Mod+Shift+I".action.move-column-to-workspace-up = [ ];

        # Mouse Wheel Navigation
        "Mod+WheelScrollDown" = {
          cooldown-ms = 150;
          action.focus-workspace-down = [ ];
        };
        "Mod+WheelScrollUp" = {
          cooldown-ms = 150;
          action.focus-workspace-up = [ ];
        };
        "Mod+Shift+WheelScrollDown" = {
          cooldown-ms = 150;
          action.move-column-to-workspace-down = [ ];
        };
        "Mod+Shift+WheelScrollUp" = {
          cooldown-ms = 150;
          action.move-column-to-workspace-up = [ ];
        };

        "Mod+WheelScrollRight".action.focus-column-right = [ ];
        "Mod+WheelScrollLeft".action.focus-column-left = [ ];
        "Mod+Ctrl+WheelScrollRight".action.move-column-right = [ ];
        "Mod+Ctrl+WheelScrollLeft".action.move-column-left = [ ];

        "Mod+Alt+WheelScrollDown".action.focus-column-right = [ ];
        "Mod+Alt+WheelScrollUp".action.focus-column-left = [ ];
        "Mod+Ctrl+Alt+WheelScrollDown".action.move-column-right = [ ];
        "Mod+Ctrl+Alt+WheelScrollUp".action.move-column-left = [ ];

        # Numbered Workspaces
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;

        # Window Sizing & Consumption
        "Mod+BracketLeft".action.consume-or-expel-window-left = [ ];
        "Mod+BracketRight".action.consume-or-expel-window-right = [ ];
        "Mod+Comma".action.consume-window-into-column = [ ];
        "Mod+Period".action.expel-window-from-column = [ ];

        "Mod+D" = {
          repeat = false;
          action.switch-preset-column-width = [ ];
        };
        "Mod+R" = {
          repeat = false;
          action.switch-preset-column-width-back = [ ];
        };
        "Mod+Shift+D".action.switch-preset-window-height = [ ];
        "Mod+Ctrl+D".action.reset-window-height = [ ];

        "Mod+F".action.maximize-column = [ ];
        "Mod+Shift+F".action.fullscreen-window = [ ];
        "Mod+Ctrl+F".action.expand-column-to-available-width = [ ];
        "Mod+C".action.center-column = [ ];

        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";
        "Mod+Shift+Minus".action.set-window-height = "-10%";
        "Mod+Shift+Equal".action.set-window-height = "+10%";

        "Mod+A".action.toggle-window-floating = [ ];
        "Mod+Shift+A".action.switch-focus-between-floating-and-tiling = [ ];
        "Mod+W".action.toggle-column-tabbed-display = [ ];

        # System & Tools
        "Mod+Shift+S" = {
          hotkey-overlay.title = "Snipping Tool";
          action.screenshot = {
            show-pointer = false;
          };
        };
        "Mod+X" = {
          hotkey-overlay.title = "Toggle transparency";
          action.toggle-window-rule-opacity = [ ];
        };
        "Mod+Shift+Insert" = {
          hotkey-overlay.title = "Toggle inhibit shortcuts";
          action.toggle-keyboard-shortcuts-inhibit = [ ];
        };

        # Noctalia Shell
        "Mod+Slash" = {
          hotkey-overlay.title = "Keybind Cheatsheet";
          action.spawn-sh = "noctalia-shell ipc call plugin:keybind-cheatsheet toggle";
        };
        "Alt+Space" = {
          hotkey-overlay.title = "Application Launcher";
          action.spawn-sh = "noctalia-shell ipc call launcher toggle";
        };
        "Mod+M" = {
          hotkey-overlay.title = "Control Center";
          action.spawn-sh = "noctalia-shell ipc call controlCenter toggle";
        };
        "Mod+Shift+M" = {
          hotkey-overlay.title = "Settings";
          action.spawn-sh = "noctalia-shell ipc call settings toggle";
        };
        "Mod+V" = {
          hotkey-overlay.title = "Clipboard History";
          action.spawn-sh = "noctalia-shell ipc call launcher clipboard";
        };
        "Mod+Shift+C" = {
          hotkey-overlay.title = "Calender";
          action.spawn-sh = "noctalia-shell ipc call calendar toggle";
        };
        "Mod+Delete" = {
          hotkey-overlay.title = "Session Menu";
          action.spawn-sh = "noctalia-shell ipc call sessionMenu toggle";
        };
        "Mod+Alt+Down" = {
          hotkey-overlay.title = "System Monitor";
          action.spawn-sh = "noctalia-shell ipc call systemMonitor toggle";
        };

        "Mod+P" = {
          allow-when-locked = true;
          hotkey-overlay.title = "Play/Pause media";
          action.spawn-sh = "noctalia-shell ipc call media toggle";
        };
        "Mod+Shift+P" = {
          allow-when-locked = true;
          hotkey-overlay.title = "Play/Pause media";
          action.spawn-sh = "noctalia-shell ipc call media playPause";
        };
        "Mod+Shift+N" = {
          allow-when-locked = true;
          hotkey-overlay.title = "Next media";
          action.spawn-sh = "noctalia-shell ipc call media next";
        };
        "Mod+Shift+B" = {
          allow-when-locked = true;
          hotkey-overlay.title = "Previous media";
          action.spawn-sh = "noctalia-shell ipc call media previous";
        };

        "Mod+Shift+Alt+W" = {
          hotkey-overlay.title = "Set Wallpaper";
          action.spawn-sh = "noctalia-shell ipc call wallpaper toggle";
        };
        "Mod+N" = {
          hotkey-overlay.title = "Note Panel";
          action.spawn-sh = "noctalia-shell ipc call plugin:todo togglePanel";
        };
        "Mod+T" = {
          hotkey-overlay.title = "Notifications Panel";
          action.spawn-sh = "noctalia-shell ipc call notifications toggleHistory";
        };
        "Mod+Shift+T" = {
          hotkey-overlay.title = "Clear oldest notifications";
          action.spawn-sh = "noctalia-shell ipc call notifications removeOldestHistory";
        };
        "Mod+Alt+Up" = {
          hotkey-overlay.title = "Toggle Bar Visibilty";
          action.spawn-sh = "noctalia-shell ipc call bar toggle";
        };
        "Mod+Alt+T" = {
          hotkey-overlay.title = "Toggle DND";
          action.spawn-sh = "noctalia-shell ipc call notifications toggleDND";
        };
        "Mod+Insert" = {
          hotkey-overlay.title = "Cycle power profiles";
          action.spawn-sh = "noctalia-shell ipc call powerProfile cycle";
        };
        "Mod+Alt+Space" = {
          hotkey-overlay.title = "Window Switcher access";
          action.spawn-sh = "noctalia-shell ipc call launcher windows";
        };

        # Hardware keys
        "F12" = {
          allow-when-locked = true;
          hotkey-overlay.title = "Increase volume";
          action.spawn-sh = "noctalia-shell ipc call volume increase";
        };
        "F11" = {
          allow-when-locked = true;
          hotkey-overlay.title = "Decrease volume";
          action.spawn-sh = "noctalia-shell ipc call volume decrease";
        };
        "F10" = {
          allow-when-locked = true;
          hotkey-overlay.title = "Mute volume";
          action.spawn-sh = "noctalia-shell ipc call volume muteOutput";
        };
        "F9" = {
          allow-when-locked = true;
          hotkey-overlay.title = "Mute microphone";
          action.spawn-sh = "noctalia-shell ipc call volume muteInput";
        };
        "F2" = {
          allow-when-locked = true;
          hotkey-overlay.title = "Increase brightness";
          action.spawn-sh = "noctalia-shell ipc call brightness increase";
        };
        "F1" = {
          allow-when-locked = true;
          hotkey-overlay.title = "Decrease brightness";
          action.spawn-sh = "noctalia-shell ipc call brightness decrease";
        };
      };

      animations = {
        enable = true;
        slowdown = 1.5;
      };

      debug = {
        # Allows notification actions and window activation from Noctalia.
        honor-xdg-activation-with-invalid-serial = true;
      };

      layer-rules = [
        {
          matches = [ { namespace = "^noctalia-overview"; } ];
          place-within-backdrop = true;
        }
      ];

      layout = {
        gaps = 10;
        background-color = "transparent";

        # Options: never, always, on-overflow
        center-focused-column = "never";
        always-center-single-column = true;
        # empty-workspace-above-first = true;
        default-column-display = "normal";

        preset-column-widths = [
          { proportion = 1.0 / 3.0; }
          { proportion = 1.0 / 2.0; }
          { proportion = 2.0 / 3.0; }
        ];
        default-column-width = {
          proportion = 1.0 / 2.0;
        };

        focus-ring.enable = false;
        border = {
          enable = true;
          width = 3.2;
        };

        shadow = {
          enable = true;

          draw-behind-window = true;
          softness = 30;
          spread = 5;
          offset = {
            x = 0;
            y = 5;
          };
          color = "#0007";
        };

        tab-indicator = {
          enable = true;

          hide-when-single-tab = true;
          place-within-column = true;
          gap = 5;
          width = 3;
          length.total-proportion = 1.0;
          position = "right";
          gaps-between-tabs = 5;
          corner-radius = 1000;
        };

        # structs = {
        #   left = 0;
        #   right = 0;
        #   top = 0;
        #   bottom = 0;
        # };
      };

      # https://yalter.github.io/niri/Configuration:-Outputs
      outputs."eDP-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.001;
        };
        scale = 1.0;

        # WARN: Error below!
        # hot-corners = {
        #   enable = true;
        #
        #   top-left = false;
        #   top-right = false;
        #   bottom-left = false;
        #   bottom-right = true;
        # };
      };

      # https://yalter.github.io/niri/Configuration:-Window-Rules
      window-rules = [
        {
          matches = [
            {
              app-id = "zen-beta$";
              title = "^Picture-in-Picture$";
            }
          ];
          open-floating = true;
          default-column-width.fixed = 480;
          default-window-height.fixed = 270;
          default-floating-position = {
            x = 0;
            y = 0;
            relative-to = "bottom-right";
          };
        }

        {
          matches = [ { app-id = "^kitty$"; } ];
          draw-border-with-background = false;
        }

        {
          matches = [ { app-id = "^anki$"; } ];
          opacity = 0.89;
          draw-border-with-background = false;
          clip-to-geometry = true;
        }

        {
          matches = [ { app-id = "^floating.*"; } ];
          open-floating = true;
          draw-border-with-background = false;
          default-column-width = {
            proportion = 0.75;
          };
          default-window-height = {
            proportion = 0.90;
          };
        }

        # Neovim Dynamic Mode Colors
        {
          matches = [ { title = "^nvim-N"; } ];
          border = {
            active.color = "#89b4fb";
            inactive.color = "#1e1e2e";
            urgent.color = "#f38ba9";
          };
        }

        {
          matches = [ { title = "^nvim-I"; } ];
          border = {
            active.color = "#a6e3a2";
            inactive.color = "#1e1e2e";
            urgent.color = "#f38ba9";
          };
        }

        {
          matches = [ { title = "^nvim-V"; } ];
          border = {
            active.color = "#cba6f8";
            inactive.color = "#1e1e2e";
            urgent.color = "#f38ba9";
          };
        }

        {
          matches = [ { title = "^nvim-C"; } ];
          border = {
            active.color = "#fab388";
            inactive.color = "#1e1e2e";
            urgent.color = "#f38ba9";
          };
        }

        {
          matches = [ { title = "^nvim-R"; } ];
          border = {
            active.color = "#f38ba8";
            inactive.color = "#1e1e2e";
            urgent.color = "#f38ba9";
          };
        }

        # Noctalia shell
        {
          geometry-corner-radius = {
            top-left = 20.0;
            top-right = 20.0;
            bottom-right = 20.0;
            bottom-left = 20.0;
          };
          clip-to-geometry = true;
        }
      ];
    };
  };

  xdg.configFile."niri/config.kdl".enable = lib.mkForce false;
  home.activation.writeNiriConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ${config.xdg.configHome}/niri

    rm -f ${config.xdg.configHome}/niri/config.kdl

    cat ${pkgs.writeText "niri-base" config.programs.niri.finalConfig} > ${config.xdg.configHome}/niri/config.kdl

    echo "" >> ${config.xdg.configHome}/niri/config.kdl
    echo "// Dynamically load Noctalia's generated colors" >> ${config.xdg.configHome}/niri/config.kdl
    echo 'include "${config.xdg.configHome}/niri/noctalia.kdl"' >> ${config.xdg.configHome}/niri/config.kdl

    chmod 644 ${config.xdg.configHome}/niri/config.kdl
  '';
}
