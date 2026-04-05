{
  flake.homeModules."anki" =
    { pkgs, ... }:

    {
      catppuccin.anki.enable = true;

      home.packages = [
        pkgs.anki.withAddons
        (with pkgs.ankiAddons; [
          anki-connect
          review-heatmap
          ajt-card-management
          recolor
        ])
      ];
    };
}
