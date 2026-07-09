{
  lib,
  config,
  ...
}:

{
  options = {
    modules.user.cli.ssh.enable = lib.mkEnableOption "user-level ssh client settings";
  };

  config = lib.mkIf config.modules.user.cli.ssh.enable {
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
          User = "suwapotta";
          Port = "24";
        };

        "laptop" = {
          HostName = "192.168.1.27";
          User = "suwapotta";
          Port = "24";
        };
      };
    };
  };
}
