vim.pack.add({
	{
		src = "https://github.com/neovim/nvim-lspconfig",
		name = "nvim-lspconfig",
	},
})

vim.lsp.enable({
	"lua_ls",
	"nixd",
	"clangd",
	"pyright",
	"ruff",
	"bashls",
	"verible",
	"svls",
	"marksman",
	"texlab",
	"html",
	"cssls",
	"jsonls",
	-- "eslint"
})
