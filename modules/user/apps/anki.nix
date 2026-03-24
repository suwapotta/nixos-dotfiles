{
  flake.homeModules."anki" =
    { pkgs, ... }:

    {
      catppuccin.anki.enable = true;

      home.packages = [
        (pkgs.anki.withAddons [
          pkgs.ankiAddons.anki-connect
          pkgs.ankiAddons.review-heatmap
        ])
      ];
    };
}
