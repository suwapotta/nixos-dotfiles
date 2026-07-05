{
  lib,
  config,
  ...
}:

{
  options = {
    modules.user.apps.zathura.enable = lib.mkEnableOption "zathura - vim-like pdf viewer";
  };

  config = lib.mkIf config.modules.user.apps.zathura.enable {
    programs.zathura.enable = true;
  };
}
