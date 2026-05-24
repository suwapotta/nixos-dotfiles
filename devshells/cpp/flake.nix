{
  description = "C++ (Devshell)";

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
            name = "C++";

            packages = with pkgs; [
              gcc
              clang-tools
              lldb
              gtest

              ruff
              pyright
              (python314.withPackages (
                python-pkgs: with python-pkgs; [
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

            env = [
              {
                name = "NIX_CFLAGS_COMPILE";
                value = "-isystem ${pkgs.gtest.dev}/include";
              }
              {
                name = "GTEST_INCLUDE";
                value = "${pkgs.gtest.dev}/include";
              }
              {
                name = "GTEST_LIB";
                value = "${pkgs.gtest}/lib";
              }
            ];

            devshell.motd = ''
               {45}Welcome to C++.{reset}
              Enter 'menu' for general commands.
            '';
          };
        };
    };
}
