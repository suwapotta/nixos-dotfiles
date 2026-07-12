{
  lib,
  config,
  ...
}:

let
  boolToStr = b: if b then "true" else "false";
  cfg = config.modules.core.hardware.msi;
in
{
  options = {
    modules.core.hardware.msi = {
      enable = lib.mkEnableOption "msi laptop specific settings";

      ec = {
        preset = lib.mkOption {
          type = lib.types.nullOr (
            lib.types.enum [
              "eco"
              "comfort"
              "turbo"
            ]
          );
          default = null;
          description = "hardware shift mode for msi-ec module";
        };

        coolerBoost = lib.mkOption {
          type = lib.types.nullOr lib.types.bool;
          default = null;
          description = "force the fans to maximum speed";
        };

        webcamBlock = lib.mkOption {
          type = lib.types.nullOr lib.types.bool;
          default = null;
          description = "cut power to the integrated webcam";
        };

        kbdBacklight = lib.mkOption {
          type = lib.types.nullOr (lib.types.ints.between 0 3);
          default = null;
          description = "keyboard backlight brightness level (0 = off, 3 = max)";
        };
      };
    };
  };

  config = lib.mkIf cfg.enable {
    boot = {
      kernelModules = [
        "msi-ec"
      ];

      extraModulePackages = [
        config.boot.kernelPackages.msi-ec
      ];

      kernelParams = [
        "nvme.noacpi=1"
        "video.report_key_events=0"
      ];
    };

    systemd.tmpfiles.rules = [
      "w /sys/class/power_supply/BAT1/charge_control_start_threshold - - - - 70"
      "w /sys/class/power_supply/BAT1/charge_control_end_threshold - - - - 80"
    ]
    ++ lib.optionals (cfg.ec.preset != null) [
      "w /sys/devices/platform/msi-ec/shift_mode - - - - ${cfg.ec.preset}"
    ]
    ++ lib.optionals (cfg.ec.coolerBoost != null) [
      "w /sys/devices/platform/msi-ec/cooler_boost - - - - ${boolToStr cfg.ec.coolerBoost}"
    ]
    ++ lib.optionals (cfg.ec.webcamBlock != null) [
      "w /sys/devices/platform/msi-ec/webcam_block - - - - ${boolToStr cfg.ec.webcamBlock}"
    ]
    ++ lib.optionals (cfg.ec.kbdBacklight != null) [
      "w /sys/devices/platform/msi-ec/leds/msiacpi::kbd_backlight/brightness - - - - ${toString cfg.ec.kbdBacklight}"
    ];
  };
}
