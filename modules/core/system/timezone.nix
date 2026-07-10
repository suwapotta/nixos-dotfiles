{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.system.timezone.enable = lib.mkEnableOption "hcm timezone";
  };

  config = lib.mkIf config.modules.core.system.timezone.enable {
    time.timeZone = "Asia/Ho_Chi_Minh";
  };
}
