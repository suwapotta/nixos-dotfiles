{ pkgs, ... }:

{
  home.packages = [
    (pkgs.anki.withAddons [
      pkgs.ankiAddons.anki-connect
      pkgs.ankiAddons.review-heatmap
    ])
  ];
}
