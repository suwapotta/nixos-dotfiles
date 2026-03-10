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

extras = {
    # --- Coding & Workflow ---
    coding.blink.enable = true;
    coding.luasnip.enable = true;
    coding.mini-surround.enable = true;
    coding.yanky.enable = true;

    # --- Editor Features ---
    editor.inc-rename.enable = true;
    editor.snacks_explorer.enable = true;
    editor.snacks_picker.enable = true;

    # --- UI & Utilities ---
    ui.treesitter-context.enable = true;
    util.dot.enable = true;
    util.mini-hipatterns.enable = true;

    # --- Debugging & Testing ---
    dap.core.enable = true;
    test.core.enable = true;

    # --- Languages ---
    lang.clangd.enable = true;        # C/C++
    lang.json.enable = true;          # JSON
    lang.markdown.enable = true;      # Markdown
    lang.nix.enable = true;           # Nix
    lang.tex.enable = true;           # LaTeX
    lang.toml.enable = true;          # TOML
    
    lang.python = {
      enable = true;
      installDependencies = true;        # Installs ruff, pyright, etc. via Nix
      installRuntimeDependencies = true; # Installs python3, pip, etc. via Nix
    };
  };

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
