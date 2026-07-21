{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    modules.containers.testbox.enable = lib.mkEnableOption "basic container";
  };

  config = lib.mkIf config.modules.containers.testbox.enable {

    containers."testbox" = {
      autoStart = false;
      privateNetwork = false;

      config = {
        environment = {
          systemPackages = with pkgs; [
            fetch
          ];

          sessionVariables = {
            TERM = "xterm-256color";
          };
        };

        programs = {
          bash.shellInit = /* bash */ ''
            set -o vi
          '';

          nano.enable = false;

          neovim = {
            enable = true;
            defaultEditor = true;
          };
        };

        system.stateVersion = "26.05";
      };
    };

  };
}
