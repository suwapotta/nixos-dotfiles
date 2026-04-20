{
  flake.homeModules."direnv" = {
    programs.direnv = {
      enable = true;

      enableFishIntegration = true;
    };
  };
}
