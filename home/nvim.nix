{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      clang-tool
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
      lua-language-server
      stylua
      texlab
      bibtex-tidy
      texlivePackages.latexindent
      arduino-language-server
      verible
      svls

      tree-sitter
    ];
  };

}
