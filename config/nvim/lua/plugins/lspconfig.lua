vim.pack.add({
	{
		src = "https://github.com/neovim/nvim-lspconfig",
		name = "nvim-lspconfig",
	},
})

vim.diagnostic.config({
	underline = true,
	update_in_insert = false,
	severity_sort = true,

	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
	},

	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

vim.lsp.enable({
	"lua_ls",
	"nixd",
})
