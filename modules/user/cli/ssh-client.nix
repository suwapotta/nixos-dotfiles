{
  lib,
  config,
  hostList,
  userName,
  ...
}:

let
  cfg = config.modules.user.cli.ssh-client;
in
{
  options = {
    modules.user.cli.ssh-client = {
      enable = lib.mkEnableOption "user-level ssh client settings";
      keyGen = lib.mkOption {
        type = lib.types.nullOr (lib.types.enum hostList);
        default = null;
        description = "which machine to generate ssh key from sops";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      settings = {
        "github.com" = {
          HostName = "github.com";
          User = "git";
          IdentityFile = "~/.ssh/github_ed25519";
          IdentitiesOnly = "yes";
        };

        "desktop" = {
          HostName = "192.168.1.201";
          User = userName;
          Port = "24";
        };

        "laptop" = {
          HostName = "192.168.1.27";
          User = userName;
          Port = "24";
        };
      };
    };

    sops.secrets = lib.mkIf (cfg.keyGen != null) {
      "id_${cfg.keyGen}" = {
        sopsFile = ../../../secrets/user-level/ssh-keys.yaml;
        path = "${config.home.homeDirectory}/.ssh/id_ed25519";
      };

      "github_${cfg.keyGen}" = {
        sopsFile = ../../../secrets/user-level/ssh-keys.yaml;
        path = "${config.home.homeDirectory}/.ssh/github_ed25519";
      };
    };
  };
}
