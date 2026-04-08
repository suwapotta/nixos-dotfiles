return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,

  opts = {
    transparent_background = true,

    float = {
      transparent = true,
      solid = true,
    },

    -- Force completion menu background to be transparent
    custom_highlights = function(colors)
      return {
        Pmenu = { bg = "none" },
        PmenuSel = { bg = colors.surface0, fg = "none" },
      }
    end,
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd("CatppuccinCompile")

    vim.cmd.colorscheme("catppuccin")
  end,
}
