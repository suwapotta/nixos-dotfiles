vim.pack.add({
  {
    src = "https://github.com/neovim-treesitter/nvim-treesitter",
    name = "nvim-treesitter",
  },
  {
    src = "https://github.com/nvim-lua/plenary.nvim",
    name = "plenary.nvim",
  }
})

local langs = {
        "lua",
        "vim",
        "bash",
        "zsh",
        "fish",
        "kitty",
        "regex",
        "html",
        "javascript",
        "tsx",
        "json",
        "arduino",
        "c",
        "cpp",
        "css",
        "systemverilog",
        "latex",
        "bibtex",
        "python",
        "scss",
        "svelte",
        "typst",
        "vue",
        "kdl",
        "yaml",
        "markdown",
        "markdown_inline",
        "make",
        "nix",
};

require("nvim-treesitter").install(langs)

vim.api.nvim_create_autocmd('FileType', {
  pattern = langs,
  callback = function()
    vim.treesitter.start()

    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    vim.wo.foldmethod = 'expr'
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
