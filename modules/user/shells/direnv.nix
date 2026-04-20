{
  flake.homeModules."direnv" = {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;

      config = {
        global = {
          log_format = "\\u001B[2mdirenv: %s\\u001B[0m";
          hide_env_diff = true;
        };
      };

      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
