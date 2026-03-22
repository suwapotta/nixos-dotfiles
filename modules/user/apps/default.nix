{ pkgs, ... }:

{
  imports = [
    ./anki.nix
    ./zen-beta.nix
  ];

  home.packages = with pkgs; [
    zathura
  ];
}
