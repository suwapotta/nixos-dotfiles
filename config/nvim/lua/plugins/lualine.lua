vim.pack.add({
	{
		src = "https://github.com/nvim-lualine/lualine.nvim",
		name = "lualine",
	},
	{
		src = "https://github.com/nvim-tree/nvim-web-devicons",
		name = "web-devicons",
	},
})

require("lualine").setup({})
