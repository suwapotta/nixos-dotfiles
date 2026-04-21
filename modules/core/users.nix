{
  flake.nixosModules."users" = {
    users.users."suwapotta" = {
      isNormalUser = true;

      extraGroups = [
        "wheel"
        "networkmanager"
      ];
    };
  };
}
