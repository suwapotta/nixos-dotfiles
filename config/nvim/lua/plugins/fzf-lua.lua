vim.pack.add({
	{
		src = "https://github.com/ibhagwan/fzf-lua",
		name = "fzf-lua",
		depends = "mini.icons",
	},
})

require("fzf-lua").setup({
	previewers = {
		builtin = {
			extensions = {
				["png"] = { "chafa", "-f", "symbols", "{file}" },
				["jpg"] = { "chafa", "-f", "symbols", "{file}" },
				["jpeg"] = { "chafa", "-f", "symbols", "{file}" },
				["gif"] = { "chafa", "-f", "symbols", "{file}" },
				["svg"] = { "chafa", "-f", "symbols", "{file}" },
				["webp"] = { "chafa", "-f", "symbols", "{file}" },

				["pdf"] = { "pdftotext", "{file}", "-" },
			},
		},
	},
})
