vim.pack.add({
	{
		src = "https://github.com/neovim/nvim-lspconfig",
		name = "nvim-lspconfig",
	},
})

vim.lsp.enable({
	"lua_ls",
	-- "clangd",
	-- "nixd",
})
