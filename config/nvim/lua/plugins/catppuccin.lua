vim.pack.add({ {
	src = "https://github.com/catppuccin/nvim",
	name = "catppuccin",
} })

require("catppuccin").setup({
	transparent_background = true,

	---@diagnostic disable-next-line: unused-local
	custom_highlights = function(colors)
		return {
			NormalFloat = { bg = "NONE" },
			FloatBorder = { bg = "NONE" },
			FloatTitle = { bg = "NONE" },

			FzfLuaNormal = { bg = "NONE" },
			FzfLuaBorder = { bg = "NONE" },

			MiniFilesNormal = { bg = "NONE" },
			MiniFilesBorder = { bg = "NONE" },
			MiniFilesTitle = { bg = "NONE" },

			Pmenu = { bg = "NONE" },
			BlinkCmpMenu = { bg = "NONE" },
			BlinkCmpMenuBorder = { bg = "NONE" },
			BlinkCmpDoc = { bg = "NONE" },
			BlinkCmpDocBorder = { bg = "NONE" },
		}
	end,

	auto_integrations = false,
	integrations = {
		blink_cmp = true,

		fzf = true,

		treesitter = true,

		gitsigns = true,

		noice = true,
		notify = true,

		mini = {
			enabled = true,
			indentscope_color = "",
		},

		native_lsp = {
			enabled = true,

			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},

			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},

			inlay_hints = {
				background = true,
			},
		},
	},
})

vim.cmd.colorscheme("catppuccin-nvim")
