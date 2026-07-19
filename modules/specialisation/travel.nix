{
  lib,
  config,
  ...
}:

{
  options = {
    modules.specialisation.travel.enable = lib.mkEnableOption "battery saving boot specialisation";
  };

  config = lib.mkIf config.modules.specialisation.travel.enable {
    specialisation."Travel".configuration = {
      system.nixos.tags = [ "Travel" ];

      modules = {
        containers = {
          testbox.enable = lib.mkForce false;
        };

        core = {
          hardware = {
            _battery-optimisation.enable = true;
            bluetooth.enable = lib.mkForce false;
            msi = {
              enable = lib.mkForce true;
              ec = {
                preset = lib.mkForce "eco";
                coolerBoost = lib.mkForce false;
                webcamBlock = lib.mkForce true;
                kbdBacklight = lib.mkForce 0;
              };
            };
            nvidia-disable.enable = lib.mkForce true;
            nvidia-offload.enable = lib.mkForce false;
            nvidia-sync.enable = lib.mkForce false;
          };

          services = {
            mcontrolcenter.enable = lib.mkForce false;
            openssh.enable = lib.mkForce false;
            power = {
              enable = lib.mkForce true;
              mode = lib.mkForce "power-saver";
            };
            tailscale.enable = lib.mkForce false;
          };
        };
      };
    };
  };
}
