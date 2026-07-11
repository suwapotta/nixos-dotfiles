{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.services.logind.enable =
      lib.mkEnableOption "controls how laptop behaves when closing lid";
  };

  config = lib.mkIf config.modules.core.services.logind.enable {
    services.logind.settings.Login = {
      HandleLidSwitch = "poweroff";
      HandleLidSwitchExternalPower = "lock";
      HandleLidSwitchDocked = "ignore";
    };
  };
}
