{
  lib,
  config,
  pkgs,
  ...
}:

{
  options = {
    modules.core.system.global-pkgs.enable = lib.mkEnableOption "environment pkgs";
  };

  config = lib.mkIf config.modules.core.system.global-pkgs.enable {
    environment.systemPackages = with pkgs; [
      just

      wget
      curl
    ];
  };
}
