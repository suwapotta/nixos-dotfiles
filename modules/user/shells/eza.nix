{
  lib,
  config,
  ...
}:

{
  options = {
    modules.user.shells.eza.enable = lib.mkEnableOption "eza - ls replacement";
  };

  config = lib.mkIf config.modules.user.shells.eza.enable {
    programs.eza.enable = true;
  };
}
