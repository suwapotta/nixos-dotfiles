vim.pack.add({
	{
		src = "https://github.com/echasnovski/mini.files",
		name = "mini.files",
	},
})

require("mini.files").setup({
	options = {
		show_hidden = true,
	},

	windows = {
		preview = true,
		width_preview = 80,

		width_focus = 30,
		width_nofocus = 15,
	},
})
