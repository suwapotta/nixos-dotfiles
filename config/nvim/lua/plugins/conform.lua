vim.pack.add({
	{
		src = "https://github.com/stevearc/conform.nvim",
		name = "conform",
	},
})

require("conform").setup({
	formatters_by_ft = {
		cpp = { "clangd-format" },
		lua = { "stylua" },
		nix = { "nixfmt" },
		python = { "ruff_fix", "ruff_format" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		zsh = { "shfmt" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		tex = { "latexindent" },
		bib = { "bibtex-tidy" },

		-- Fallback if no lsp is attached
		["_"] = { "trim_whitespace" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
