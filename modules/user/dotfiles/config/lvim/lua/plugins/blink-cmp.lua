return {
  "saghen/blink.cmp",

  opts = {
    keymap = {
      ["<C-Space>"] = {},
      ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },

    completion = {
      menu = {
        border = "rounded",
        winblend = 0,
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
          winblend = 0,
        },
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
  },

  opts_extend = { "sources.default" },
}
