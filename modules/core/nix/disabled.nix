{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.nix.disabled.enable = lib.mkEnableOption "disable nano editor";
  };

  config = lib.mkIf config.modules.core.nix.disabled.enable {
    programs.nano.enable = false;
  };
}
