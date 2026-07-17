vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		name = "blink.cmp",
		version = vim.version.range("^1"),
		depends = { "friendly-snippets" },
	},
})

---@module "blink.cmp"
require("blink.cmp").setup({
	keymap = {
		preset = "default",
	},

	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},

	completion = {
		ghost_text = {
			enabled = true,
		},

		menu = {
			border = "rounded",
			winblend = 0,
		},

		documentation = {
			auto_show = true,
			auto_show_delay_ms = 200,
			window = { border = "rounded", winblend = 0 },
		},
	},

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },

	signature = {
		enabled = true,

		trigger = {
			show_on_insert = true,
		},

		window = {
			border = "rounded",
		},
	},
})
