{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Target the latest kernel
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ ];
    extraModulePackages = [ ];
  };

  # Network
  networking = {
    hostName = "NixOS-VM";
    networkmanager.enable = true;
  };

  # Bluetooth
  # hardware.bluetooth = {
  #   enable = true;
  #   powerOnBoot.enable = true;
  # };

  # Set time zone
  time.timeZone = "Asia/Ho_Chi_Minh";

  services = {
    # Explicit VM settings
    qemuGuest.enable = true;
    spice-vdagentd.enable = true;

    # ly - display manager of choice
    displayManager.ly = {
      enable = true;
    };

    # Enable sound
    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    # Enable touchpad support
    libinput.enable = true;

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";
        PasswordAuthentication = false;
      };
    };

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

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    unzip

    wl-clipboard
    xwayland-satellite
    bibata-cursors
    imagemagick
    nautilus

    wget
    curl
    git
    lazygit

    fastfetch
    fish
    kitty
    starship
    zoxide
    eza
    yazi
    fd
    fzf
    ripgrep
    tealdeer
    bat
    entr
    tmux
    cava
    btop
    zathura
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
    config.niri.default = [
      "gnome"
      "gtk"
    ];
  };

  # Enable flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # DO NOT change the state version below!
  system.stateVersion = "25.11";
}
