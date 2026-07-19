{
  lib,
  config,
  hostList,
  userName,
  ...
}:

{
  options = {
    modules.core.system.users.enable = lib.mkEnableOption "users declaration";
  };

  config = lib.mkIf config.modules.core.system.users.enable {
    users.users."${userName}" = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
      ];
      hashedPasswordFile = config.sops.secrets."normal-user".path;

      openssh.authorizedKeys.keyFiles = map (host: ../../../public/ssh-keys/id_${host}.pub) hostList;
    };
  };
}
