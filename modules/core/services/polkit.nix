{
  lib,
  config,
  ...
}:

let
  cfg = config.modules.core.services.polkit;
in
{
  options = {
    modules.core.services.polkit = {
      enable = lib.mkEnableOption "the polkit backend security framework";
      useSoteriaFrontend = lib.mkEnableOption "the Soteria GUI authentication agent";
    };
  };

  config = lib.mkIf cfg.enable {
    security = {
      polkit.enable = true;
      soteria.enable = cfg.useSoteriaFrontend;
    };
  };
}
