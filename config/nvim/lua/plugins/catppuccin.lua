vim.pack.add({
	{
		src = "https://github.com/catppuccin/nvim",
		name = "catppuccin",
	},
})

---@module "catppuccin"
require("catppuccin").setup({
	transparent_background = true, -- disables setting the background color

	float = {
		transparent = true, -- enable transparent floating windows
		solid = "rounded", -- use solid styling for floating windows, see |winborder|
	},

	-- Custom colors override
	custom_highlights = function(colors)
		return {
			NormalFloat = { bg = colors.none },
			FloatBorder = { bg = colors.none },
			FloatTitle = { bg = colors.red, fg = colors.base },

			BlinkCmpMenu = { bg = colors.none },
			BlinkCmpMenuBorder = { bg = colors.none },

			Pmenu = { bg = colors.none },
			PmenuSel = { bg = colors.surface0, fg = colors.none },
		}
	end,

	auto_integrations = false,

	-- NOTE: https://github.com/catppuccin/nvim#integrations
	integrations = {
		blink_cmp = true,
		gitsigns = true,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
})

-- Setup must be called before loading
vim.cmd.colorscheme("catppuccin-nvim")
