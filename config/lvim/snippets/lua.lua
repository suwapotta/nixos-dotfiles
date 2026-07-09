local ls = require("luasnip")
local lse = require("luasnip.extras.fmt")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local fmt = lse.fmt

return {
  s(
    "luasnipcontext",
    fmt(
      [[
    local ls = require("luasnip")
    local lse = require("luasnip.extras.fmt")
    local s = ls.snippet
    local t = ls.text_node
    local i = ls.insert_node
    local fmt = lse.fmt

    return {
      <>
    }
    ]],
      {
        i(1),
      },
      { delimiters = "<>" }
    )
  ),

  s(
    "addsnippet",
    fmt(
      [=[
      s(
        "<>",
        fmt(
          [[
          <>
          ]],
          {
            <>
          }<>
        )
      ),
      ]=],
      {
        i(1, "trigger"),
        i(2, "body"),
        i(3, "nodes"),
        c(4, {
          t(""),
          t(', { delimiters = "<>" }'),
        }),
      },
      { delimiters = "<>" }
    )
  ),
}
