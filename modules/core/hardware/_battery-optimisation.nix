{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.hardware._battery-optimisation.enable = lib.mkEnableOption "battery optimisation";
  };

  config = lib.mkIf config.modules.core.hardware._battery-optimisation.enable {
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

      extraModprobeConfig = /* sh */ ''
        # Force audio chip to go to sleep after 1s
        options snd_hda_intel power_save=1 power_save_controller=Y
      '';
    };
  };
}
