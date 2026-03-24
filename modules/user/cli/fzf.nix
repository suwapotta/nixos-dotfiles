{
  flake.nixosModules."fzf" = {
    catppuccin.fzf.enable = true;

    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
