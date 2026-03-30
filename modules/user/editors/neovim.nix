{
  flake.homeModules."neovim" =
    { pkgs, ... }:

    {
      programs.neovim = {
        enable = true;
        defaultEditor = true;

        extraPackages = with pkgs; [
          # arduino-cli
          # arduino-language-server
          # lldb
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

          (python314.withPackages (qs: with qs; [ pygments ]))
          imagemagick
          sqlite
          trash-cli
          tree-sitter
          ghostscript
          mermaid-cli
          xdg-utils
        ];
      };

    };
}
