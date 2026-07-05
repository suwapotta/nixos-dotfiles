{
  lib,
  config,
  ...
}:

{
  options = {
    modules.user.apps.only-office.enable = lib.mkEnableOption "only office - alt. to ms";
  };

  config = lib.mkIf config.modules.user.apps.only-office.enable {
    programs.onlyoffice = {
      enable = true;

      settings = {
        UITheme = "theme-night";
      };
    };
  };
}
