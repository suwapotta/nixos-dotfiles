{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.distributed-build.enable = lib.mkEnableOption "remote building nixos generation";
  };

  config = lib.mkIf config.modules.core.distributed-build.enable {
    nix = {
      distributedBuilds = true;

      buildMachines = [
        {
          hostName = "192.168.1.201";
          sshUser = "nix-builder";
          sshKey = "/root/.ssh/id_ed25519";

          systems = [ "x86_64-linux" ];
          protocol = "ssh-ng";
          maxJobs = 32; # Ryzen 9 7950X
          speedFactor = 2;
          supportedFeatures = [
            "nixos-test"
            "benchmark"
            "big-parallel"
            "kvm"
          ];
          mandatoryFeatures = [ ];
        }
      ];

      extraOptions = ''
        builders-use-substitutes = true
      '';
    };
  };
}
