{
  lib,
  config,
  hostList,
  hostName,
  hosts,
  ...
}:

let
  validBuilderList = builtins.filter (name: (name != hostName) && hosts.${name}.isBuilder) hostList;
in
{
  options = {
    modules.core.nix.distributed-build.enable = lib.mkEnableOption "remote building nixos generation";
  };

  config = lib.mkIf config.modules.core.nix.distributed-build.enable {
    sops.secrets = {
      # ── ssh-keys.yaml ──────────────────────────────────────────────────────────────
      "remote-builder-${hostName}-x86_64" = {
        # owner = "root";
        sopsFile = ../../../secrets/system-level/ssh-keys.yaml;
      };
    };

    nix = {
      distributedBuilds = true;

      buildMachines = map (
        targetName:
        let
          targetConfig = hosts.${targetName};
        in
        {
          hostName = targetConfig.ip;
          sshUser = "remotebuilder";
          sshKey = config.sops.secrets."remote-builder-${hostName}-x86_64".path;

          systems = [ targetConfig.arch ];
          protocol = "ssh-ng";
          inherit (targetConfig) maxJobs speedFactor;
          supportedFeatures = [
            "nixos-test"
            "benchmark"
            "big-parallel"
            "kvm"
          ];
          mandatoryFeatures = [ ];
        }
      ) validBuilderList;

      extraOptions = ''
        builders-use-substitutes = true
      '';
    };

    programs.ssh.extraConfig = lib.concatMapStringsSep "\n" (
      targetName:
      let
        targetConfig = hosts.${targetName};
      in
      ''
        Host                  ${targetConfig.ip}
        User                  remotebuilder
        Port                  22
        IdentityFile          ${config.sops.secrets."remote-builder-${hostName}-x86_64".path}
        IdentitiesOnly        yes
        StrictHostKeyChecking accept-new
      ''
    ) validBuilderList;
  };
}
