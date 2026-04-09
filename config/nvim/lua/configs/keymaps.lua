local keymap = vim.keymap.set
local silent = { silent = true }

-- Moving line(s) with Alt+J/K
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", silent)
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", silent)
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", silent)
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", silent)
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", silent)
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", silent)

-- fzf-lua
keymap("n", "<leader>ff", "<cmd>FzfLua files<CR>", silent)
keymap("n", "<leader><leader>", "<cmd>FzfLua files<CR>", silent)
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", silent)
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", silent)

-- conform.nvim
keymap("n", "<leader>cf", function()
	require("conform").format({
		bufnr = 0,
		lsp_format = "fallback",
		async = false,
		timeout_ms = 500,
	})
end, silent)

-- mini-files
keymap("n", "<leader>e", function()
	require("mini.files").open()
end, silent)

-- Toggle inlay_hint (lsp feature)
keymap("n", "<leader>th", function()
	local is_enabled = vim.lsp.inlay_hint.is_enabled()
	vim.lsp.inlay_hint.enable(not is_enabled)
end, silent)
