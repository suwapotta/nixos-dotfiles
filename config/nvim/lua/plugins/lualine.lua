vim.pack.add({
	{
		src = "https://github.com/nvim-lualine/lualine.nvim",
		name = "lualine",
	},
	{
		src = "https://github.com/echasnovski/mini.icons",
		name = "mini.icons",
	},
})

require("mini.icons").setup({})
require("lualine").setup({})
