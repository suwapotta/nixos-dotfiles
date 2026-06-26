local ls = require("luasnip")
local lse = require("luasnip.extras.fmt")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = lse.fmt

return {
  s("mathinline", { t("$"), i(1), t("$"), i(0) }),

  s(
    "mathcentered",
    fmt(
      [[
      $
        {}
      $
      {}
      ]],
      {
        i(1),
        i(0),
      }
    )
  ),

  s("bold", { t("*"), i(1), t("*"), i(0) }),

  s("italic", { t("_"), i(1), t("_"), i(0) }),

  s("mono", { t("`"), i(1), t("`"), i(0) }),

  s(
    "codeblock",
    fmt(
      [[
      ```{}
      {}
      ```
      {}
      ]],
      {
        i(1, "language"),
        i(2, "code"),
        i(0),
      }
    )
  ),

  s(
    "enumerate",
    fmt(
      [[
      + {}
      {}
      ]],
      {
        i(1, "item"),
        i(0),
      }
    )
  ),

  s(
    "item",
    fmt(
      [[
      - {}
      {}
      ]],
      {
        i(1, "item"),
        i(0),
      }
    )
  ),

  s(
    "ref",
    fmt(
      [[
      <{}>{}
      ]],
      {
        i(1, "ref"),
        i(0),
      }
    )
  ),

  s(
    "cite",
    fmt(
      [[
      @{}
      ]],
      {
        i(1, "ref"),
      }
    )
  ),
}
