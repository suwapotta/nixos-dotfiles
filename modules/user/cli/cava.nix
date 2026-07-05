{
  lib,
  config,
  ...
}:

{
  options = {
    modules.user.cli.cava.enable = lib.mkEnableOption "cava - audio visualiser";
  };

  config = lib.mkIf config.modules.user.cli.cava.enable {
    programs.cava.enable = true;
  };
}
