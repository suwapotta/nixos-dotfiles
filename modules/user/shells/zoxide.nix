{
  lib,
  config,
  ...
}:

{
  options = {
    modules.user.shells.zoxide.enable = lib.mkEnableOption "zoxide - cd that learns path overtime";
  };

  config = lib.mkIf config.modules.user.shells.zoxide.enable {
    programs.zoxide = {
      enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
    };
  };
}
