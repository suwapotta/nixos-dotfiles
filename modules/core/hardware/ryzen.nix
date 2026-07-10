{
  lib,
  config,
  ...
}:

{
  options = {
    modules.core.hardware.ryzen.enable = lib.mkEnableOption "amd cpu";
  };

  config = lib.mkIf config.modules.core.hardware.ryzen.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;

      # extraPackages = with pkgs; [
      # ];
    };
  };
}
