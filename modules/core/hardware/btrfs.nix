{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.hardware.btrfs.enable = lib.mkEnableOption "btrfs autoscrub";
  };

  config = lib.mkIf config.modules.core.hardware.btrfs.enable {
    services.btrfs.autoScrub = {
      enable = true;

      interval = "weekly";
      fileSystems = [ "/" ];
    };
  };
}
