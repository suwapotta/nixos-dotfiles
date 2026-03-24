{
  flake.nixosModules."experimental" = {
    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
