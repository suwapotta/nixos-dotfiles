{
  lib,
  config,
  hostName,
  hosts,
  userName,
  ...
}:

{
  options = {
    modules.user.cli.ssh-client.enable = lib.mkEnableOption "user-level ssh client settings";
  };

  config = lib.mkIf config.modules.user.cli.ssh-client.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      settings =
        lib.mapAttrs (name: hostConfig: {
          HostName = hostConfig.ip;
          User = userName;
          Port = "24";
        }) hosts
        // {
          "github.com" = {
            HostName = "github.com";
            User = "git";
            IdentityFile = "~/.ssh/github_ed25519";
            IdentitiesOnly = "yes";
          };
        };
    };

    sops.secrets = {
      "id_${hostName}" = {
        sopsFile = ../../../secrets/user-level/ssh-keys.yaml;
        path = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };

      "github_${hostName}" = {
        sopsFile = ../../../secrets/user-level/ssh-keys.yaml;
        path = "${config.home.homeDirectory}/.ssh/github_ed25519";
      };
    };
  };
}
