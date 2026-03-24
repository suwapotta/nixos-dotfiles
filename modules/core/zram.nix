{
  flake.nixosModules."zram" = {
    zramSwap = {
      enable = true;
      priority = 100;
    };
  };
}
