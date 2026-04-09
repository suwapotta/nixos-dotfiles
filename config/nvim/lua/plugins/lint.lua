vim.pack.add({
	{
		src = "https://github.com/mfussenegger/nvim-lint",
		name = "nvim-lint",
	},
})

require("lint").linters_by_ft = {
	nix = { "statix" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		require("lint").try_lint()
	end,
})
