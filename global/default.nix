{
  imports = [
    ./audio.nix
    ./auto-login.nix # Annoying warning and no log-out option
    ./bluetooth.nix
    ./boot-loader.nix
    ./btrfs.nix
    ./experimental.nix
    # ./garbage-collect.nix
    ./hybrid.nix
    ./kernel.nix
    ./keyd.nix
    # ./ly.nix # Can't go into tty from menu
    ./network.nix
    ./nh.nix
    ./packages.nix
    ./portals.nix
    ./timezone.nix
    ./users.nix
    ./variables.nix
    ./zram.nix
  ];
}
