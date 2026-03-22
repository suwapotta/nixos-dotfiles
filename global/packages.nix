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

    fastfetch
    fish
    kitty
    eza
    yazi
    fd
    fzf
    ripgrep
    entr
    cava
    btop
    zathura
  ];
}
