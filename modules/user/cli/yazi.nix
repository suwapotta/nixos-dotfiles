{
  flake.homeModules."yazi" = {
    programs.yazi = {
      enable = true;

      shellWrapperName = "yy";
      enableFishIntegration = false;
    };
  };
}
