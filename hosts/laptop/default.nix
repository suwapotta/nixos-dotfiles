{ self, inputs, ... }:

{
  flake.nixosConfigurations."laptop" = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit self inputs; };
    modules = [
      # host
      ./configuration.nix
      ./hardware-configuration.nix

      # core
      self.nixosModules."audio"
      self.nixosModules."auto-login"
      self.nixosModules."bluetooth"
      self.nixosModules."systemd-boot"
      self.nixosModules."btrfs"
      self.nixosModules."disabled"
      self.nixosModules."experimental"
      self.nixosModules."fonts"
      self.nixosModules."git"
      self.nixosModules."keyd"
      self.nixosModules."network"
      self.nixosModules."nh"
      self.nixosModules."nvidia"
      self.nixosModules."packages"
      self.nixosModules."polkit"
      self.nixosModules."portals"
      self.nixosModules."programs"
      self.nixosModules."services"
      self.nixosModules."timezone"
      self.nixosModules."touchpad"
      self.nixosModules."users"
      self.nixosModules."variables"
      self.nixosModules."zen-kernel"
      self.nixosModules."zram"

      # specialisation
      self.nixosModules."gaming"
      self.nixosModules."qemu"

      # user
      self.nixosModules."home-manager"
    ];
  };
}
