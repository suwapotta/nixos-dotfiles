{
  flake.nixosModule."bluetooth" = {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
  };
}
