vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter-context",
		name = "nvim-treesitter-context",
		depends = { "nvim-treesitter" },
	},
})

-- 2. Configure the behavior
require("treesitter-context").setup({})
