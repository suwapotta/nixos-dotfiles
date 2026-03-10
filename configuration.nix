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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "NixOS";

  # Network
  networking.networkmanager.enable = true;

  # Bluetooth
  # hardware.bluetooth.enable = true;
  # hardware.bluetooth.powerOnBoot.enable = true;

  # Set time zone
  time.timeZone = "Asia/Ho_Chi_Minh";

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
  programs.niri.enable = true;
  programs.nano.enable = false;
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    gcc
    gnumake

    wl-clipboard
    xwayland-satellite

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
    tmux
  ];

  # Use nerd fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
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
