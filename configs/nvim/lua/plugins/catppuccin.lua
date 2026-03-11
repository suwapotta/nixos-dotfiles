return {
	"catppuccin/nvim",

	opts = {
		transparent_background = true,
		float = {
			transparent = true,
			solid = true,
		},

		custom_highlights = function(colors)
			return {
				Pmenu = { bg = "none" },
				PmenuSel = { bg = colors.surface1, fg = "none" },
			}
		end,
	},

	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd.colorscheme("catppuccin")
	end,
}
