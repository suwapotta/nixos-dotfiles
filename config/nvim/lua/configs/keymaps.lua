local keymap = vim.keymap.set
local silent = { silent = true }

-- Quality of life
keymap("n", "<C-c>", ":%y+<CR>", silent)
keymap("n", "gh", "^", silent)
keymap("n", "gl", "$", silent)

-- Commenting motions
keymap("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", silent)
keymap("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", silent)

-- Navigating window splits with Ctrl+HJKL
keymap("n", "<C-h>", "<C-w>h", silent)
keymap("n", "<C-j>", "<C-w>j", silent)
keymap("n", "<C-k>", "<C-w>k", silent)
keymap("n", "<C-l>", "<C-w>l", silent)

-- Buffer navigations
keymap("n", "H", "<cmd>bprevious<cr>}", silent)
keymap("n", "L", "<cmd>bnext<cr>", silent)
keymap("n", "<leader>bb", "<cmd>e #<cr>", silent)
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", silent)

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
keymap("n", "<leader>fc", "<cmd>FzfLua grep_cword<CR>", silent)
keymap("n", "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", silent)
keymap("n", "<leader>fs", "<cmd>FzfLua spell_suggest<CR>", silent)
keymap("n", "<leader>fh", "<cmd>FzfLua help_tags<CR>", silent)
keymap("n", "<leader>fk", "<cmd>FzfLua keymaps<CR>", silent)
keymap("n", "<leader>fr", "<cmd>FzfLua resume<CR>", silent)
keymap("n", "<leader>ldd", "<cmd>FzfLua diagnostics_document<CR>", silent)
keymap("n", "<leader>ldw", "<cmd>FzfLua diagnostics_workspace<CR>", silent)

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

-- Lazygit
keymap("n", "<leader>lg", "<cmd>LazyGit<CR>", silent)
