{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # arduino-cli
      clang-tools
      lldb
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
      nil
      nixfmt
      statix
      lua-language-server
      stylua
      texlab
      tectonic
      bibtex-tidy
      texlivePackages.latexindent
      arduino-language-server
      verible
      svls

      (python314.withPackages (qs: with qs; [ pygments ]))
      trash-cli
      tree-sitter
      ghostscript
      mermaid-cli
    ];
  };

}
