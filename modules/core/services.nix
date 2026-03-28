{
  flake.nixosModules."services" = {
    services = {
      # Dependencies for noctalia-shell
      power-profiles-daemon.enable = true;
      gvfs.enable = true;
      upower.enable = true;
    };
  };
}
