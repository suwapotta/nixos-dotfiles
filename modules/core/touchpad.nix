{
  flake.nixosModules."touchpad" = {
    services.libinput.enable = true;
  };
}
