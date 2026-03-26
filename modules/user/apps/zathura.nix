{
  flake.homeModules."zathura" =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [
        zathura
      ];
    };
}
