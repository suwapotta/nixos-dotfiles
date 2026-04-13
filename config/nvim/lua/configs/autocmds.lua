local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("HighlightYank", { clear = true }),

  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})


-- Wrap and check for spell in text filetypes
autocmd("FileType", {
  pattern = { "text", "markdown", "gitcommit" },

  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
