{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    modules.user.shells.entr.enable = lib.mkEnableOption "entr - run commands when file changes";
  };

  config = lib.mkIf config.modules.user.shells.entr.enable {
    home.packages = with pkgs; [
      entr
    ];
  };
}
