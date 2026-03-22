{
  imports = [
    ./audio.nix
    ./auto-login.nix # Annoying warning and no log-out/userspace reboot option
    ./bluetooth.nix
    ./boot-loader.nix
    ./btrfs.nix
    ./experimental.nix
    ./hybrid.nix
    ./kernel.nix
    ./keyd.nix
    # ./ly.nix # Can't go into tty from menu
    ./network.nix
    ./nh.nix
    ./packages.nix
    ./portals.nix
    ./qemu.nix
    ./timezone.nix
    ./users.nix
    ./environment.nix
    ./zram.nix
  ];
}
