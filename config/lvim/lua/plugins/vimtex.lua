return {
  "lervag/vimtex",

  lazy = true,
  ft = { "tex", "bib", "latex" },

  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_delim_toggle_mod_list = {
      { "\\left", "\\right" },
      { "\\big", "\\big" },
      { "\\Big", "\\Big" },
      { "\\bigg", "\\bigg" },
      { "\\Bigg", "\\Bigg" },
    }
  end,
}
