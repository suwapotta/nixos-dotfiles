return {
  "catppuccin/nvim",

  opts = {
    transparent_background = true,

    float = {
      transparent = true,
      solid = true,
    },

    -- Force completion menu background to be transparent
    custom_highlights = function(colors)
      return {
        Pmenu = { bg = colors.none },
        PmenuSel = { bg = colors.surface0, fg = colors.none },

        FzfLuaFzfHeader = { fg = colors.subtext1 },

        BlinkCmpMenu = { bg = colors.none },
        BlinkCmpMenuBorder = { bg = colors.none },
      }
    end,
  },
}
