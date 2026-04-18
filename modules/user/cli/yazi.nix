{
  flake.homeModules."yazi" = {
    programs.yazi = {
      enable = true;

      shellWrapperName = "y";
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
