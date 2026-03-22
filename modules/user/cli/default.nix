{ pkgs, ... }:

{
  imports = [
    ./bat.nix
    ./fastfetch.nix
    ./fzf.nix
    ./lazygit.nix
    ./tealdeer.nix
    ./tmux.nix
  ];

  home.packages = with pkgs; [
    yazi
    cava
    btop
  ];
}
