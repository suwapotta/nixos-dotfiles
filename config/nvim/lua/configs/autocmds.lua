-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),

  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})
