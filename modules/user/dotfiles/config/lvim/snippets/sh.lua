local ls = require("luasnip")
local lse = require("luasnip.extras.fmt")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = lse.fmt

return {
  s(
    "condition",
    fmt(
      [=[
      [[ {} -{} {} ]]
      ]=],
      {
        c(1, {
          t(""),
          t("!"),
        }),
        i(2, "d"),
        i(3, "build/"),
      }
    )
  ),
}
