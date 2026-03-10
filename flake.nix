{
    description = "Minimal NixOS flake implementation";

    inputs = { 
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        noctalia = {
          url = "github:noctalia-dev/noctalia-shell";
          inputs.nixpkgs.follows = "nixpkgs";
          inputs.noctalia-qs.follows = "noctalia-qs";
        };

        noctalia-qs = {
          url = "github:noctalia-dev/noctalia-qs";
          inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, ...}@inputs: {
        nixosConfigurations.NixOS = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";

	    specialArgs = { inherit inputs; };

            modules = [
                ./configuration.nix
		./noctalia.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useGlobalPkgs = true;
                        useUserPackages = true;

			extraSpecialArgs = { inherit inputs; };

                        users.suwapotta = import ./home.nix;
                        backupFileExtension = "backup";
                    };
                }
            ];
        };
    };
}
