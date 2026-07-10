vim.pack.add({
	{
		src = "https://github.com/ibhagwan/fzf-lua",
		name = "fzf-lua",
		depends = { "mini.icons" },
	},
})

---@module "fzf-lua"
---@type fzf-lua.Config|{}
require("fzf-lua").setup({
	keymap = {
		fzf = {
			["ctrl-a"] = "toggle-all",
			["ctrl-d"] = "half-page-down",
			["ctrl-u"] = "half-page-up",
		},
	},
})
-- Hijack neovim default ui
require("fzf-lua").register_ui_select()

-- KEYMAPS
local keymap = vim.keymap.set

-- Buffers and files
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "Find Open Buffers" })
keymap("n", "<leader><space>", "<cmd>FzfLua files<cr>", { desc = "Find Files" })
keymap("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find Files (alt.)" })

-- Grep
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live Grep (Search Code)" })

-- LSP/Diagnostics
keymap("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "LSP Code actions" })
keymap("n", "<leader>cd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "LSP Definitions" })

-- Misc
keymap("n", "<leader>fr", "<cmd>FzfLua resume<cr>", { desc = "Resume last Search" })
keymap("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Find Help Pages" })
keymap("n", "<leader>fm", "<cmd>FzfLua manpages<cr>", { desc = "Find man pages" })
keymap("n", "<leader>cm", "<cmd>FzfLua marks<cr>", { desc = "Find (code) marks" })
keymap("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", { desc = "Find Keymaps" })
keymap("n", "<leader>ft", "<cmd>FzfLua filetypes<cr>", { desc = "Find file types" })
keymap("n", "z=", "<cmd>FzfLua spell_suggest<cr>", { desc = "Find spell suggestions" })

-- Zoxide
keymap("n", "<leader>fz", "<cmd>FzfLua zoxide<cr>", { desc = "Find ``zoxide edit``" })
