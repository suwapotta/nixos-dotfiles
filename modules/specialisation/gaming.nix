{
  flake.nixosModules."gaming" =
    { lib, ... }:

    {
      specialisation = {
        "Gaming".configuration = {
          system.nixos.tags = [ "Gaming" ];

          # Proton-GE performance boost
          # boot.kernelModules = [ "ntsync" ];
          # services.udev.extraRules = ''
          #   KERNEL=="ntsync", MODE="0666"
          # '';

          hardware.nvidia = {
            prime.sync.enable = lib.mkForce true;
            prime.offload = {
              enable = lib.mkForce false;
              enableOffloadCmd = lib.mkForce false;
            };

            powerManagement.finegrained = lib.mkForce false;
          };
        };
      };
    };
}
