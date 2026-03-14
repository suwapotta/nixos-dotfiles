{
  pkgs,
  config,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../../global
  ];

  # Target the latest zen kernel with msi-ec
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = [ config.boot.kernelPackages.msi-ec ];
    kernelModules = [
      "msi-ec"
      "ec_sys"
    ];
    kernelParams = [
      "hid_apple.fnmode=2"
    ];
  };

  # zRAM
  zramSwap = {
    enable = true;
    priority = 100;
  };

  # Btrfs weekly scrubbing
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  # nix-collect-garbage automation
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 15d";
  };

  # Network
  networking = {
    hostName = "NixOS";
    networkmanager.enable = true;
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Set time zone
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Remove glitchy audio issue
  security.rtkit.enable = true;

  services = {
    # Enable sound
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };

    # Enable touchpad support
    libinput.enable = true;
    power-profiles-daemon.enable = true;
    gvfs.enable = true;
  };

  # Define a user account
  users.users.suwapotta = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    # packages = with pkgs; [
    #   # User's packages
    # ];
  };

  # Specific program settings
  programs = {
    niri.enable = true;
    nix-ld.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];

    config.common.default = "*";
  };

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # DO NOT change the state version below!
  system.stateVersion = "25.11";
}
