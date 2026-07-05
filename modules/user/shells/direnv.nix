{
  lib,
  config,
  ...
}:

let
  ESC = builtins.fromJSON ''"\u001B"'';
in
{
  options = {
    modules.user.shells.direnv.enable = lib.mkEnableOption "direnv - manages shell environment";
  };

  config = lib.mkIf config.modules.user.shells.direnv.enable {
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
