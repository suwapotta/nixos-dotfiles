{
  description = "LaTeX (Devshell)";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devshell.url = "github:numtide/devshell";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devshell.flakeModule ];

      systems = [ "x86_64-linux" ];

      perSystem =
        { pkgs, ... }:

        {
          devshells.default = {
            name = "LaTeX";

            packages = with pkgs; [
              ghostscript

              tectonic

              bibtex-tidy
              texlab
              texlivePackages.latexindent
            ];

            devshell.motd = ''
               {45}Welcome to LaTeX.{reset}
              Enter 'menu' for general commands.
            '';
          };
        };
    };
}
