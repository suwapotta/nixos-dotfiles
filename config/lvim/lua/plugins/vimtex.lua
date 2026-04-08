return {
  "lervag/vimtex",

  lazy = true,
  ft = { "tex", "bib", "latex" },

  init = function()
    vim.g.vimtex_view_method = "zathura"

    vim.g.vimtex_compiler_method = "tectonic"
    vim.g.vimtex_compiler_tectonic = {
      out_dir = "",
      options = {
        -- "--keep-logs",
        "--synctex",
        "-Z",
        "shell-escape",
      },
    }
  end,
}
