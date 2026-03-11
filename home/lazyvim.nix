{ pkgs, inputs, ... }:

{
  imports = [
    inputs.lazyvim.homeManagerModules.default
  ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };

    lazyvim = {
      enable = true;
      configFiles = ./config/nvim/lua;

      extras = {
        coding = {
          blink.enable = true;
          luasnip.enable = true;
          mini-surround.enable = true;
          yanky.enable = true;
        };

        editor = {
          inc-rename.enable = true;
          snacks_explorer.enable = true;
          snacks_picker.enable = true;
        };

        ui = {
          treesitter-context.enable = true;
        };

        util = {
          dot.enable = true;
          mini-hipatterns.enable = true;
        };

        dap = {
          core.enable = true;
        };

        test = {
          core.enable = true;
        };

        lang = {
          clangd.enable = true;
          json.enable = true;
          markdown.enable = true;
          nix.enable = true;
          tex.enable = true;
          toml.enable = true;
          python.enable = true;
        };
      };

      extraPackages = with pkgs; [
        # LSP servers
        nil
        pyright
        bash-language-server
        clang-tools
        lua-language-server
        marksman
        markdown-toc
        markdownlint-cli2
        mermaid-cli
        taplo
        texlab
        svls
        verible

        # Formatters
        nixfmt
        ruff
        shfmt
        shellcheck
        stylua
        nodePackages.prettier
        bibtex-tidy
        statix

        # snake.nvim
        ghostscript
        tectonic
      ];
    };
  };
}
