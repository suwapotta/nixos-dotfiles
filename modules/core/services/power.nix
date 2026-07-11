{
  lib,
  config,
  ...
}:

let
  cfg = config.modules.core.services.power;
in
{
  options = {
    modules.core.services.power = {
      enable = lib.mkEnableOption "collection of power daemons";
      type = lib.mkOption {
        type = lib.types.nullOr (
          lib.types.enum [
            "power-saver"
            "balanced"
            "performance"
          ]
        );
        default = null;
        description = "wether to enable systemd services for power-profiles-daemon";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      power-profiles-daemon.enable = true;
      upower.enable = true;
    };

    # systemd.
  };
}
