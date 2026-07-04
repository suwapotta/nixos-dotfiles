{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.users.enable = lib.mkEnableOption "users declaration";
  };

  config = lib.mkIf config.modules.core.users.enable {
    users.users."suwapotta" = {
      isNormalUser = true;

      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };
}
