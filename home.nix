{
  config,
  pkgs,
  inputs,
  ...
}:

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
      lang.clangd.enable = true; # C/C++
      lang.json.enable = true; # JSON
      lang.markdown.enable = true; # Markdown
      lang.nix.enable = true; # Nix
      lang.tex.enable = true; # LaTeX
      lang.toml.enable = true; # TOML

      lang.python = {
        enable = true;
        installDependencies = true; # Installs ruff, pyright, etc. via Nix
        installRuntimeDependencies = true; # Installs python3, pip, etc. via Nix
      };
    };

    extraPackages = with pkgs; [
      # LSP servers
      nil # Nix
      pyright # Python
      nodePackages.bash-language-server # Bash
      clang-tools # C/C++ (clangd)
      lua-language-server # Lua
      marksman # Markdown
      taplo # TOML
      texlab # LaTeX
      svls # SystemVerilog
      verible # SystemVerilog (linting/formatting)

      # Formatters
      nixfmt # Nix
      ruff # Python (LSP/Formatter)
      shfmt # Shell
      shellcheck # Shell
      stylua # Lua
      nodePackages.prettier # Web/Markdown
      bibtex-tidy # LaTeX
      statix # Nix linter
    ];
  };

  programs.tmux = {
    enable = true;

    # Native configuration
    baseIndex = 1;
    keyMode = "vi";
    shell = "${pkgs.fish}/bin/fish";

    # Native plugins
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
      yank
      resurrect
      continumm
    ];

    # Custom binds and styling
    extraConfig = ''
      # Vim-like pane navigation
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # Consistency pane border
      set-option -g pane-border-style "fg=#45475b,bg=default"
      set-option -g pane-active-border-style "fg=#45475b,bg=default"

      # Allow tmux to set the host terminal window's title
      set-option -g set-titles on
      set-option -g set-titles-string "#T"

      # Extra base-index settings to catch panes
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      ## Status bar configuration
      set -g status off
      set -g status-style bg=default
      set -g status-right ""
      set -g status-left ""
      set -g status-justify centre
      set -g pane-border-line single
      set-option -g status-position top

      # Vim-like keybindings for yanking text
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
    '';
  };
}
