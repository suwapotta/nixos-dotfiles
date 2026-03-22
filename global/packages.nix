{ pkgs, ... }:

{
  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    unzip

    nautilus
    adwaita-icon-theme
    mcontrolcenter

    wget
    curl
  ];
}
