{
  flake.homeModules."catppuccin" =
    { inputs, ... }:

    {
      imports = [
        inputs.catppuccin.homeModules.catppuccin
      ];

      catppuccin = {
        accent = "sapphire";
        flavor = "mocha";
      };
    };
}
