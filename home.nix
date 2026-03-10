{ config, pkgs, inputs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/configs";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  # Standard .config/ directories
  configs = {
    niri = "niri";
    kitty = "kitty";
    fish = "fish";
    fastfetch = "fastfetch";
    yazi = "yazi";
    "starship.toml" = "starship.toml";
  };
in

{
  home.username = "suwapotta";
  home.homeDirectory = "/home/suwapotta";
  home.stateVersion = "25.11";

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

imports = [
    inputs.lazyvim.homeManagerModules.default
  ];

programs.lazyvim = {
  enable = true;
  configFiles = ./configs/nvim/lua;

  extraPackages = with pkgs; [
    # LSP servers
      nil                           # Nix
      pyright                       # Python
      nodePackages.bash-language-server # Bash
      clang-tools                   # C/C++ (clangd)
      lua-language-server           # Lua
      marksman                      # Markdown
      taplo                         # TOML
      texlab                        # LaTeX
      svls                          # SystemVerilog
      verible                       # SystemVerilog (linting/formatting)

    # Formatters
      nixfmt                        # Nix
      ruff                          # Python (LSP/Formatter)
      shfmt                         # Shell
      shellcheck                    # Shell
      stylua                        # Lua
      nodePackages.prettier         # Web/Markdown
      bibtex-tidy                   # LaTeX
      statix                        # Nix linter
];
};
}
