{
  flake.nixosModule."disabled" = {
    programs.nano.enable = false;
  };
}
