{ pkgs, ... }:

{
  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    unzip

    wl-clipboard
    xwayland-satellite
    imagemagick
    nautilus
    adwaita-icon-theme
    mcontrolcenter

    wget
    curl

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
}
