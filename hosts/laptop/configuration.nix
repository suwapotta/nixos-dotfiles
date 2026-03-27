{
  # WARN: DO NOT change the state version below no matter what!
  system.stateVersion = "25.11";

  services = {
    # Dependencies for noctalia-shell
    power-profiles-daemon.enable = true;
    gvfs.enable = true;
    upower.enable = true;
  };

  programs = {
    # Linking binaries for lazyvim
    nix-ld.enable = true;

    # Required for home-manager to start-up (System Management tool)
    dconf.enable = true;
  };
}
