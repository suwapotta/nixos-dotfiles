{
  config,
  lib,
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

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager)
  services.libinput.enable = true;

  # Define a user account
  users.users.suwapotta = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
    ];
  };

  # Specific program settings
  programs = {
    niri.enable = true;
    nano.enable = false;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
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
  ];

  # Use nerd fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono

    ubuntu-sans

    roboto

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List enabled services
  services.openssh.enable = true;
  services.displayManager.ly.enable = true;
  services.power-profiles-daemon.enable = true;
  services.gvfs.enable = true;
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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable flakes + home manager
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # DO NOT change the state version below
  system.stateVersion = "25.11";
}
