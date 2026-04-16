{
  flake.homeModules."neovim" =
    { pkgs, ... }:

    {
      programs.neovim = {
        enable = true;
        defaultEditor = true;
        withRuby = true;
        withPython3 = true;

        extraPackages = with pkgs; [
          # Debuggers
          lldb
          python314Packages.debugpy
          bashdb

          # LSPs/Formatters
          clang-tools
          pyright
          ruff
          bash-language-server
          shellcheck
          shfmt
          vscode-langservers-extracted
          marksman
          markdownlint-cli2
          markdown-toc
          prettier
          nixd
          nixfmt
          statix
          lua-language-server
          stylua
          texlab
          tectonic
          bibtex-tidy
          texlivePackages.latexindent
          verible
          svls
          taplo
          vtsls
          # arduino-language-server

          # CLI tools
          (python314.withPackages (qs: with qs; [ pygments ]))
          imagemagick
          sqlite
          trash-cli
          tree-sitter
          ghostscript
          mermaid-cli
          xdg-utils
          # arduino-cli
        ];
      };

    };
}
