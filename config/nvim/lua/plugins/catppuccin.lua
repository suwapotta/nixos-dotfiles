vim.pack.add({ {
	src = "https://github.com/catppuccin/nvim",
	name = "catppuccin",
} })

require("catppuccin").setup({
	transparent_background = true,

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
