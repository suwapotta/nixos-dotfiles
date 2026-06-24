local ls = require("luasnip")
local lse = require("luasnip.extras.fmt")
local s = ls.snippet
local i = ls.insert_node
local fmt = lse.fmt

return {
  s(
    "mathcentered",
    fmt(
      [[
      \[
        {}
      \]
      ]],
      {
        i(1),
      }
    )
  ),
}
