{ pkgs, ... }:

{
  imports = [
    ./eza.nix
    ./fish.nix
    ./starship.nix
    ./zoxide.nix
  ];

  home.packages = with pkgs; [
    fd
    ripgrep
    entr
  ];
}
