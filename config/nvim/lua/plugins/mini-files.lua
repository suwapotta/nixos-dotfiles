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
})
