{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    modules.user.shells.eza.enable = lib.mkEnableOption "eza - ls replacement";
  };

  config = lib.mkIf config.modules.user.shells.eza.enable {
    programs.eza = {
      enable = true;
      package = pkgs.eza.override { exaAlias = false; };

      enableFishIntegration = true;
      # enableBashIntegration = true;

      git = true;
      colors = "always";
      icons = "always";
      extraOptions = [
        "--git-repos"
        "--group-directories-first"
        "--header"
        "--hyperlink"
        "--octal-permissions"
        "--smart-group"
      ];
    };
  };
}
