{
  flake.homeModules."anki" =
    { pkgs, ... }:

    {
      home.packages = [
        (pkgs.anki.withAddons (
          with pkgs.ankiAddons;
          [
            anki-connect
            review-heatmap
            ajt-card-management
          ]
        ))
      ];
    };
}
