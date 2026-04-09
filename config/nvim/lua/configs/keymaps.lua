local keymap = vim.keymap.set
local silent = { silent = true }
local allModes = { "i", "x", "n", "s" }

keymap(allModes, "<C-s>", "<cmd>w!<CR><esc>", silent)
