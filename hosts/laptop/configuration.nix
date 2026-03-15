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

  # Linking binaries for neovim
  programs = {
    niri.enable = true;
    nix-ld.enable = true;
  };

  # DO NOT change the state version below!
  system.stateVersion = "25.11";
}
