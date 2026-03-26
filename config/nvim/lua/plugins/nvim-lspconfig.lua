return {
  "neovim/nvim-lspconfig",

  opts = {
    servers = {
      svls = {},
      nixd = {},

      arduino_language_server = {
        cmd = {
          "arduino-language-server",
          "-cli-config",
          os.getenv("HOME") .. "/.arduino15/arduino-cli.yaml",
          "-fqbn",
          "arduino:avr:uno",
        },
      },
    },
  },
}
