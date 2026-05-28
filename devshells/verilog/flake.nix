{
  description = "SystemVerilog (Devshell)";

  inputs = {
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
              gnumake

              iverilog
              verible
              svls

              surfer

              ruff
              pyright
              (python3.withPackages (
                python-pkgs: with python-pkgs; [
                  # cocotb

                  debugpy

                  pytest
                  pytest-cov
                  pytest-instafail
                  pytest-md-report
                  # pytest-sugar
                  # pytest-mock
                ]
              ))
            ];

            devshell.motd = ''
               {45}Welcome to SystemVerilog.{reset}
              Enter 'menu' for general commands.
            '';
          };
        };
    };
}
