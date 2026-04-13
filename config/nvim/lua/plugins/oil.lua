vim.pack.add({
  {
    src = "https://github.com/stevearc/oil.nvim",
    name = "oil.nvim",
    deps = "mini.icons",
  }
})

require("oil").setup({
  default_file_explorer = true,

  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },

    win_options = {
      wrap = true,
  },

  delete_to_trash = true,

  keymaps = {
    ["l"] = "actions.select",
    ["h"] = { "actions.parent", mode = "n" },
    ["<C-p>"] = "actions.preview",
    ["<C-r>"] = "actions.refresh",
  },

  view_options = {
    show_hidden = true,
    natural_order = true,

    is_always_hidden = function(name, _)
      return name == ".." or name == ".git"
    end,
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open oil" })
