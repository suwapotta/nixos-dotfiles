{
  flake.nixosModules."network" = {
    networking = {
      hostName = "NixOS";
      networkmanager.enable = true;
    };
  };
}
