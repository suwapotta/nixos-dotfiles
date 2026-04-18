return {
  "stevearc/conform.nvim",

  opts = function(_, opts)
    opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
      verilog = { "verible" },
      systemverilog = { "verible" },
      tex = { "latexindent" },
      yaml = { "prettier" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      -- rust = { "rustfmt" },
      -- kdl = { "kdlfmt" },

      ["*"] = { "codespell" },
      ["_"] = { "trim_whitespace" },
    })

    return opts
  end,
}
