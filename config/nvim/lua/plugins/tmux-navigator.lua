vim.pack.add({
	{
		src = "https://github.com/christoomey/vim-tmux-navigator",
		name = "vim-tmux-navigator",
	},
})

vim.keymap.set("n", "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", { desc = "Navigate Left (Tmux/Nvim)" })
vim.keymap.set("n", "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", { desc = "Navigate Down (Tmux/Nvim)" })
vim.keymap.set("n", "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", { desc = "Navigate Up (Tmux/Nvim)" })
vim.keymap.set("n", "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", { desc = "Navigate Right (Tmux/Nvim)" })
vim.keymap.set("n", "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", { desc = "Navigate Previous (Tmux/Nvim)" })
