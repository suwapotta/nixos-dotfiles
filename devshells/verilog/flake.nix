{
  description = "SystemVerilog (Devshell)";

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
            name = "SystemVerilog";

            packages = with pkgs; [
              verible
              svls

              iverilog

              surfer
            ];

            devshell.motd = ''
               {45}Welcome to SystemVerilog.{reset}
              Enter 'menu' for general commands.
            '';
          };
        };
    };
}
