vim.pack.add({
	{
		src = "https://github.com/stevearc/oil.nvim",
		name = "oil.nvim",
    depends = { "mini.icons" },
	},
})

require("oil").setup({
	default_file_explorer = true,

	columns = {
		"icon",
		-- "permissions",
		-- "size",
		-- "mtime",
	},

	win_options = {
		wrap = true,
	},

	delete_to_trash = true,

	keymaps = {
		["l"] = "actions.select",
		["h"] = { "actions.parent", mode = "n" },
    ["q"] = "actions.close",
		["<C-p>"] = "actions.preview",
		["<C-r>"] = "actions.refresh",
    ["<C-l>"] = false,
	},

	view_options = {
		show_hidden = true,
		natural_order = true,

		is_always_hidden = function(name, _)
			return name == ".." or name == ".git"
		end,
	},

	float = { border = "rounded", },
	confirmation = { border = "rounded", },
	progress = { border = "rounded", },
	ssh = { border = "rounded", },
	keymaps_help = { border = "rounded", },
})

local keymap = vim.keymap.set
keymap("n", "<leader>e", "<cmd>Oil --float --preview<cr>", { desc = "Open floating oil" })
keymap("n", "<leader>E", "<cmd>Oil --preview<cr>", { desc = "Open oil" })
