vim.pack.add({
	{
		src = "https://github.com/MeanderingProgrammer/render-markdown.nvim",
		name = "render-markdown.nvim",
		depends = { "nvim-treesitter", "mini.icons" },
	},
})

require("render-markdown").setup({})
