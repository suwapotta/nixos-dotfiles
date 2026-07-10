{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.services.global-programs.enable = lib.mkEnableOption "must-have programs";
  };

  config = lib.mkIf config.modules.core.services.global-programs.enable {
    programs = {
      # Linking binaries for lazyvim
      nix-ld.enable = true;

      # Required for home-manager to start-up (System Management tool)
      dconf.enable = true;
    };
  };
}
