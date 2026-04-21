-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Force terminal to exit to normal mode with Esc
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- Allow window navigation from terminal mode
vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Go to Left Window" })
vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Go to Lower Window" })
vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Go to Upper Window" })
vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Go to Right Window" })

-- Quality of life
vim.keymap.set("n", "<C-c>", "<Cmd>%y+<CR>", { desc = "Yank whole file" })
vim.keymap.set("n", "gh", "^", { desc = "Start of line (non ws)" })
vim.keymap.set("n", "gH", "0", { desc = "Start of line" })
vim.keymap.set("n", "gl", "$", { desc = "End of line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Better Ctrl-D" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Better Ctrl-U" })

-- fzf-lua
vim.keymap.set("n", "z=", "<Cmd>FzfLua spell_suggest<Cr>", { desc = "Find spell suggestions" })
vim.keymap.set("n", "<leader>fu", "<Cmd>FzfLua undotree<Cr>", { desc = "Find spell suggestions" })
