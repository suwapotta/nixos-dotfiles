{ _, ... }:

{
  boot.loader = {
    grub.enable = true;
    efi.canTouchEfiVariables = true;
  };
}
