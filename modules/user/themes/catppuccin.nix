{
  flake.homeModules."catppuccin" =
    { inputs, ... }:

    {
      imports = [ inputs.catppuccin.homeModules.catppuccin ];

      catppuccin = {
        accent = "sapphire";
        flavor = "mocha";

        ### apps
        anki.enable = true;

        ### cli
        bat.enable = true;
        fzf.enable = true;
        lazygit.enable = true;

        ### desktop
        fcitx5 = {
          enable = true;
          enableRounded = true;
        };

        ### editors

        ### shells
        fish.enable = true;
        eza.enable = true;
        starship.enable = true;

        ### terminals
        kitty.enable = true;
      };
    };
}
