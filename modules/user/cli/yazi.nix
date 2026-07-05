{
  lib,
  config,
  ...
}:

{
  options = {
    modules.user.cli.yazi.enable = lib.mkEnableOption "yazi - tui file manager";
  };

  config = lib.mkIf config.modules.user.cli.yazi.enable {
    programs.yazi = {
      enable = true;

      shellWrapperName = "y";
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
