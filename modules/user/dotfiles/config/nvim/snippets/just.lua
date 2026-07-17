local ls = require("luasnip")
local lse = require("luasnip.extras.fmt")
local s = ls.snippet
local c = ls.choice_node
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmt = lse.fmt

local function get_shell_opts(args)
  local interpreter = args[1][1]

  if interpreter ~= "bash" and interpreter ~= "sh" then
    return sn(nil, { t("") })
  end

  return sn(nil, {
    t({ "set -euo pipefail", "" }),
  })
end

return {
  s(
    "shebang",
    fmt(
      [[
      #!/usr/bin/env {}
      {}{}
      ]],
      {
        c(1, {
          t("bash"),
          t("fish"),
          t("sh"),
          t("python3"),
          t("nu"),
        }),
        d(2, get_shell_opts, { 1 }),
        i(0),
      }
    )
  ),
}
