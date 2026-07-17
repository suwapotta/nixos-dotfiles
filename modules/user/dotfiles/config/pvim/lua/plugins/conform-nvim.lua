vim.pack.add({
	{
		src = "https://github.com/stevearc/conform.nvim",
		name = "conform.nvim",
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

-- Manual keymap
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
		async = true,
	})
end, { desc = "Code Formatting" })
