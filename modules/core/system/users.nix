{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.system.users.enable = lib.mkEnableOption "users declaration";
  };

  config = lib.mkIf config.modules.core.system.users.enable {
    users.users."suwapotta" = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];

      openssh.authorizedKeys.keyFiles = [
        ../../_ssh-keys/desktop.pub
        ../../_ssh-keys/laptop.pub
      ];
    };
  };
}
