{
  lib,
  config,
  ...
}:

{
  options = {
    modules.user.shells.ripgrep.enable = lib.mkEnableOption "rg - faster grep";
  };

  config = lib.mkIf config.modules.user.shells.ripgrep.enable {
    programs.ripgrep.enable = true;
  };
}
