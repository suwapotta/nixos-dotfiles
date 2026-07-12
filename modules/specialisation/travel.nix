{
  lib,
  config,
  ...
}:

{
  options = {
    modules.specialisation.travel.enable = lib.mkEnableOption "battery saving boot specialisation";
  };

  config = lib.mkIf config.modules.specialisation.travel.enable {
    specialisation."Travel".configuration = {
      system.nixos.tags = [ "Travel" ];

      modules = {
        containers = {
          testbox.enable = lib.mkForce false;
        };

        core = {
          hardware = {
            bluetooth.enable = lib.mkForce false;
            msi = {
              enable = lib.mkForce true;
              ec = {
                preset = lib.mkForce "eco";
                coolerBoost = lib.mkForce false;
                webcamBlock = lib.mkForce true;
                kbdBacklight = lib.mkForce 0;
              };
            };
            nvidia-disable.enable = lib.mkForce true;
            nvidia-offload.enable = lib.mkForce false;
            nvidia-sync.enable = lib.mkForce false;
          };

          services = {
            mcontrolcenter.enable = lib.mkForce false;
            power = {
              enable = lib.mkForce true;
              mode = lib.mkForce "power-saver";
            };
          };
        };
      };

      # Intel CPU/iGPU
      systemd.tmpfiles.rules = [
        "w /sys/devices/system/cpu/intel_pstate/max_perf_pct - - - - 50"
      ];

      boot = {
        kernel.sysctl = {
          "vm.dirty_writeback_centisecs" = 6000;
        };

        kernelParams = [
          "i915.enable_fbc=1"
          "i915.enable_psr=2"
          "i915.enable_dc=4"
          "i915.enable_guc=3"
          "nmi_watchdog=0"
        ];

        extraModprobeConfig = ''
          # Force audio chip to go to sleep after 1s
          options snd_hda_intel power_save=1 power_save_controller=Y
        '';
      };
    };
  };
}
