{
  flake.nixosModules."gaming" =
    { lib, ... }:

    {
      specialisation = {
        "Gaming".configuration = {
          system.nixos.tags = [ "Gaming" ];

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
