return {
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.setup = opts.setup or {}
    end,
  },

  -- "mason-org/mason.nvim",
  --
  -- opts = {
  --   ensure_installed = {
  --     "arduino-language-server",
  --     "bash-debug-adapter",
  --     "bash-language-server",
  --     "bibtex-tidy",
  --     "clang-format",
  --     "clangd",
  --     "codelldb",
  --     "cssmodules-language-server",
  --     "debugpy",
  --     "fish-lsp",
  --     "json-lsp",
  --     -- "kdlfmt",
  --     "latexindent",
  --     "lua-language-server",
  --     "markdown-toc",
  --     "markdownlint-cli2",
  --     "marksman",
  --     "nil",
  --     "nixfmt",
  --     "prettier",
  --     "pyright",
  --     "ruff",
  --     "shellcheck",
  --     "shfmt",
  --     "stylua",
  --     "svlangserver",
  --     "taplo",
  --     "texlab",
  --     "tree-sitter-cli",
  --     "verible",
  --   },
  -- },
}
