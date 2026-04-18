{
  flake.homeModules."neovim" =
    { pkgs, ... }:

    {
      home.packages = with pkgs; [
        # NOTE: Since home-manager keeps writing to ~/.config/nvim/init.lua
        neovim

        # Debuggers
        lldb
        python314Packages.debugpy
        bashdb

        # LSPs/Formatters
        codespell
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
        biome
        yaml-language-server
        # arduino-language-server
        # rust-analyzer
        # rustfmt

        # CLI tools
        (python314.withPackages (
          qs: with qs; [
            pynvim
            pygments
          ]
        ))
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
}
