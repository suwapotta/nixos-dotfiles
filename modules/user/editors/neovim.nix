{
  lib,
  config,
  pkgs,
  ...
}:

let
  cfg = config.modules.user.editors.neovim;
in
{
  options = {
    modules.user.editors.neovim = {
      enable = lib.mkEnableOption "neovim - better vim";
      useMinimalConfig = lib.mkEnableOption "uses native neovim options only";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      sideloadInitLua = true;
      withRuby = false;
      withPython3 = false;

      extraPackages =
        with pkgs;
        lib.optionals (!cfg.useMinimalConfig) [
          # ── Dependencies ──────────────────────────────────────────────────────────────
          # gcc
          chafa
          imagemagick
          sqlite
          trash-cli
          tree-sitter
          xdg-utils

          # ── Lua ───────────────────────────────────────────────────────────────────────
          lua-language-server
          stylua

          # ── Nix ───────────────────────────────────────────────────────────────────────
          nixd
          nixfmt
          statix

          # ── Bash ──────────────────────────────────────────────────────────────────────
          bash-language-server
          bashdb
          shellcheck
          shfmt

          # ── Markdown ──────────────────────────────────────────────────────────────────
          markdown-toc
          markdownlint-cli2
          marksman
          mermaid-cli
          prettier

          # ── Just ──────────────────────────────────────────────────────────────────────
          just-lsp

          # ── Others (e.g., yaml, toml, etc.) ───────────────────────────────────────────
          codespell
          taplo
          yaml-language-server
          vscode-langservers-extracted
        ];
    };
  };
}
