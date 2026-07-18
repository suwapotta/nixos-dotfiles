{
  lib,
  config,
  hostList,
  ...
}:

let
  fixedHostList = builtins.filter (host: host != "desktop") hostList;
in
{
  options = {
    modules.core.nix.remote-builder.enable = lib.mkEnableOption "nixos remote builder";
  };

  config = lib.mkIf config.modules.core.nix.remote-builder.enable {
    users = {
      users."remotebuilder" = {
        isSystemUser = true;
        group = "remotebuilder";
        useDefaultShell = true;

        openssh.authorizedKeys.keyFiles = map (
          host: ../../../public/ssh-keys/remote_build_${host}.pub
        ) fixedHostList;
      };

      groups."remotebuilder" = { };
    };

    nix.settings.trusted-users = [ "remotebuilder" ];
  };
}
