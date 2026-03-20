{
  description = "NixOS Flakes with flake-parts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri-flake = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      flake-parts,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; }
      # (
      # {
      #   config,
      #   withSystem,
      #   moduleWithSystem,
      #   ...
      # }@top:

      {
        imports = [
          # Optional: use external flake logic, e.g.
          # inputs.foo.flakeModules.default
        ];

        flake =
          let
            mkHost =
              hostName:
              nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                  ./hosts/${hostName}/configuration.nix
                  ./modules/core
                  home-manager.nixosModules.home-manager
                  {
                    nixpkgs.overlays = [ inputs.niri-flake.overlays.niri ];
                  }
                  {
                    home-manager = {
                      useGlobalPkgs = true;
                      useUserPackages = true;
                      extraSpecialArgs = { inherit inputs; };
                      users.suwapotta = import ./modules/user/home.nix;
                      backupFileExtension = "bak";
                    };
                  }
                ];
              };
          in
          {
            nixosConfigurations = {
              vm = mkHost "vm";
              laptop = mkHost "laptop";
            };
          };

        systems = [
          # Systems for which you want to build the `perSystem` attributes:
          "x86_64-linux"
        ];

        # perSystem =
        # { config, pkgs, ... }:
        # {
        # Recommended: move all package definitions here.
        # e.g. (assuming you have a nixpkgs input)
        # packages.foo = pkgs.callPackage ./foo/package.nix { };
        # packages.bar = pkgs.callPackage ./bar/package.nix {
        #   foo = config.packages.foo;
        # };
        #     };
        # }
        # );
      };
}
