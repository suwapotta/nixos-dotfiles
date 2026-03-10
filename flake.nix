{
    description = "Minimal NixOS flake implementation";

    inputs = { 
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ...}: {
        nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;
                        users.suwapotta = import ./home.nix;
                        backupFileExtension = "backup";
                    };
                }
            ];
        };
    };
}
