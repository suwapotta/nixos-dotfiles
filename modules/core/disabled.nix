{
  flake.nixosModules."disabled" = {
    programs.nano.enable = false;
  };
}
