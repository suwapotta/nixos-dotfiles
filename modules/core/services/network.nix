{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.services.network.enable = lib.mkEnableOption "hostname + networkmanager";
  };

  config = lib.mkIf config.modules.core.services.network.enable {
    networking = {
      hostName = "NixOS";
      networkmanager.enable = true;
    };
  };
}
