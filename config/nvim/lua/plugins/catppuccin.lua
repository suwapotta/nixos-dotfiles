vim.pack.add({
  {
    src = "https://github.com/catppuccin/nvim",
    name = "catppuccin",
  }
})

require("catppuccin").setup({
  transparent_background = true, -- disables setting the background color

  auto_integrations = false,

  -- NOTE: https://github.com/catppuccin/nvim#integrations
  integrations = {
    blink_cmp = {
        style = "bordered",
    },
    gitsigns = true,
    mini = {
      enabled = true,
      indentscope_color = "",
  },
},
})

-- Setup must be called before loading
vim.cmd.colorscheme "catppuccin-nvim"
