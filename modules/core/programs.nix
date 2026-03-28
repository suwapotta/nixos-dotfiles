{
  flake.nixosModules."programs" = {
    programs = {
      # Linking binaries for lazyvim
      nix-ld.enable = true;

      # Required for home-manager to start-up (System Management tool)
      dconf.enable = true;
    };
  };
}
