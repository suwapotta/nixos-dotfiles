{ _, ... }:

{
  boot.loader = {
    # grub = {
    #   enable = true;
    #   efiSupport = true;
    #   device = "nodev";
    # };

    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}
