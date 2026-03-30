if true then
  return {}
end

return {
  "mfussenegger/nvim-dap",

  opts = function()
    local dap = require("dap")

    dap.configurations.cpp = dap.configurations.cpp or {}

    dap.adapters.lldb =
      {
        type = "executable",
        command = "lldb",
        name = "lldb",
      }, table.insert(dap.configurations.cpp, {
        name = "Launch with input file",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
        stdio = function()
          local input_file = vim.fn.input("Path to input file: ", vim.fn.getcwd() .. "/", "file")
          if input_file == "" then
            return nil
          end
          return { input_file, nil, nil }
        end,
      })
  end,
}
