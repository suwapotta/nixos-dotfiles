{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../global
  ];

  services = {
    # Enable touchpad support
    libinput.enable = true;

    # Dependencies for noctalia-shell
    power-profiles-daemon.enable = true;
    gvfs.enable = true;
    upower.enable = true;

  };

  # Activate polkit (niri-flake)
  security.soteria.enable = true;

  programs = {
    # Linking binaries for neovim
    nix-ld.enable = true;

    # Required for home-manager to start-up (System Management tool)
    dconf.enable = true;
  };

  # WARN: DO NOT change the state version below no matter what!
  system.stateVersion = "25.11";
}
