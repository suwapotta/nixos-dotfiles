{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./lazygit.nix
    ./tealdeer.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    fastfetch
    kitty
    yazi
    fd
    ripgrep
    entr
    cava
    btop
    zathura
  ];
}
