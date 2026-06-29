-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Smart fcitx5 toggle: remembers IME state between Insert/Normal modes
local fcitx5_state = "1" -- English (default)
local fcitx_group = vim.api.nvim_create_augroup("Fcitx5SmartToggle", { clear = true })
local allowed_filetypes = {
  typst = true,
  tex = true,
  markdown = true,
  text = true, -- *.txt
}

vim.api.nvim_create_autocmd("InsertLeave", {
  group = fcitx_group,
  callback = function()
    if not allowed_filetypes[vim.bo.filetype] then
      return
    end

    fcitx5_state = vim.fn.trim(vim.fn.system("fcitx5-remote"))
    vim.fn.system("fcitx5-remote -c")
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  group = fcitx_group,
  callback = function()
    if not allowed_filetypes[vim.bo.filetype] then
      return
    end

    -- Unikey/Mozc/Non-English IME only
    if fcitx5_state == "2" then
      vim.fn.system("fcitx5-remote -o")
    end
  end,
})
