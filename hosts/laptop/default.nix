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
      self.nixosModules."boot-loader"
      self.nixosModules."btrfs"
      self.nixosModules."disabled"
      self.nixosModules."experimental"
      self.nixosModules."fonts"
      self.nixosModules."git"
      self.nixosModules."hybrid"
      self.nixosModules."kernel"
      self.nixosModules."keyd"
      self.nixosModules."network"
      self.nixosModules."nh"
      self.nixosModules."packages"
      self.nixosModules."portals"
      self.nixosModules."qemu"
      self.nixosModules."timezone"
      self.nixosModules."users"
      self.nixosModules."variables"
      self.nixosModules."zram"

      # user
      self.nixosModules."home-manager"
    ];
  };
}
