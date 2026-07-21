return {
  "jmbuhr/otter.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },

  ft = "nix",
  config = function(_, opts)
    require("otter").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "nix",
      callback = function()
        require("otter").activate({ "bash", "sh", "lua" }, true, true, nil)
      end,
    })
  end,
  opts = {},
}
