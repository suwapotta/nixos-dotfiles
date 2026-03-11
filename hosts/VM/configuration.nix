{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Network
  networking = {
    hostName = "NixOS";
    networkmanager.enable = true;
  };

  # Bluetooth
  # hardware.bluetooth = {
  #   enable = true;
  #   powerOnBoot.enable = true;
  # };

  # Set time zone
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Input methods
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;

    fcitx5.addons = with pkgs; [
      qt6Packages.fcitx5-unikey
      fcitx5-mozc
      fcitx5-gtk
      catppuccin-fcitx5
    ];
  };

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

    openssh.enable = true;

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
    nano.enable = false;

    niri.enable = true;

    nix-ld.enable = true;
  };

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    cargo
    rustc
    tree-sitter

    wl-clipboard
    xwayland-satellite
    bibata-cursors
    imagemagick
    trash-cli
    nautilus
    qt6Packages.qt6ct
    qt6.qtwayland
    adwaita-qt6
    adwaita-icon-theme
    cosmic-icons
    adw-gtk3

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

  # Declare all font packages
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono

    roboto

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
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

  # DO NOT change the state version below
  system.stateVersion = "25.11";
}
