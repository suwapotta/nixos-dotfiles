{
  imports = [
    ./audio.nix
    # ./auto-login.nix # Annoying warning...
    ./bluetooth.nix
    ./boot-loader.nix
    ./btrfs.nix
    ./experimental.nix
    ./garbage-collect.nix
    ./hybrid.nix
    ./kernel.nix
    ./keyd.nix
    ./ly.nix
    ./network.nix
    ./packages.nix
    ./portals.nix
    ./timezone.nix
    ./users.nix
    ./variables.nix
    ./zram.nix
  ];
}
