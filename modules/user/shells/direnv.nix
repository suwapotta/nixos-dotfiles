{
  flake.homeModules."direnv" =

    let
      ESC = builtins.fromJSON ''"\u001B"'';
    in
    {
      programs.direnv = {
        enable = true;
        nix-direnv.enable = true;

        config = {
          global = {
            log_format = "${ESC}[2mdirenv: %s${ESC}[0m";
            hide_env_diff = true;
          };
        };

        enableBashIntegration = true;
        enableFishIntegration = true;
      };

      home.file.".ignore".text = ''
        .direnv/
      '';
    };
}
