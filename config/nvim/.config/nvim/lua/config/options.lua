-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Default shell
vim.opt.shell = "fish"

-- Dynamic change border color based on Neovim mode
vim.opt.title = true
vim.api.nvim_create_autocmd({ "ModeChanged", "VimEnter", "BufEnter" }, {
  callback = function()
    local mode = string.upper(vim.fn.mode())
    local filename = vim.fn.expand("%:t")

    if filename == "" then
      vim.opt.titlestring = "nvim-" .. mode .. " [Scratch]"
      return
    end

    vim.opt.titlestring = "nvim-" .. mode .. " - %t"
  end,
})
