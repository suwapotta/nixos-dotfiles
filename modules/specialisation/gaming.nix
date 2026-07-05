{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modules.specialisation.gaming;
in
{
  options.modules.specialisation.gaming = {
    enable = lib.mkEnableOption "gaming boot specialisation";

    platform = lib.mkOption {
      type = lib.types.enum [
        "desktop"
        "laptop"
      ];
      description = "host platform target tweaks";
    };
  };

  config = lib.mkIf cfg.enable {
    specialisation."Gaming".configuration = lib.mkMerge [
      # ── Global settings ───────────────────────────────────────────────────────────
      {
        system.nixos.tags = [ "Gaming" ];

        # Proton-GE performance boost
        boot.kernelModules = [ "ntsync" ];
        services.udev.extraRules = ''
          KERNEL=="ntsync", MODE="0666"
        '';

        # environment.systemPackages = with pkgs; [ mangohud ];

        # Steam + ProtonGE
        nixpkgs.config.allowUnfreePredicate =
          pkg:
          builtins.elem (lib.getName pkg) [
            "steam"
            "steam-unwrapped"
          ];
        programs = {
          steam = {
            enable = true;

            gamescopeSession.enable = true;
            extraCompatPackages = with pkgs; [ proton-ge-bin ];
          };

          gamemode.enable = true;
        };
      }

      # ── Desktop host (Full AMD) ───────────────────────────────────────────────────
      (lib.mkIf (cfg.platform == "desktop") {
        boot.kernelPackages = lib.mkForce pkgs.cachyosKernels.linuxPackages-cachyos-latest-x86_64-v4;
      })

      # ── Laptop host (iGPU + Nvidia) ───────────────────────────────────────────────
      (lib.mkIf (cfg.platform == "laptop") {
        boot.kernelPackages = lib.mkForce pkgs.cachyosKernels.linuxPackages-cachyos-latest-x86_64-v3;

        hardware.nvidia = {
          prime = {
            sync.enable = lib.mkForce true;

            offload = {
              enable = lib.mkForce false;
              enableOffloadCmd = lib.mkForce false;
            };
          };

          powerManagement.finegrained = lib.mkForce false;
        };

        environment = {
          sessionVariables = {
            LIBVA_DRIVER_NAME = lib.mkForce "nvidia";
            GBM_BACKEND = "nvidia-drm";
            __GLX_VENDOR_LIBRARY_NAME = "nvidia";
          };
        };
      })
    ];
  };
}
