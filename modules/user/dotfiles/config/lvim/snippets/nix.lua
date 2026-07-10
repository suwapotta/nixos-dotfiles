local ls = require("luasnip")
local lse = require("luasnip.extras.fmt")
local extras = require("luasnip.extras")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local rep = extras.rep
local fmt = lse.fmt

return {
  s(
    "mkModule",
    fmt(
      [[
    {
      lib,
      config,
      ...
    }:

    {
      options = {
        modules.<>.enable = lib.mkEnableOption "<>";
      };

      config = lib.mkIf config.modules.<>.enable {
        <>
      };
    }
    ]],
      {
        i(1, "name"),
        i(2, "desc"),
        rep(1),
        i(3, "option1 = true;"),
      },
      { delimiters = "<>" }
    )
  ),

  s(
    "useModule",
    fmt("modules.<>.enable = <>;", {
      i(1, "name"),
      c(2, {
        t("true"),
        t("false"),
      }),
    }, { delimiters = "<>" })
  ),

  s(
    "mkCfg",
    fmt(
      [[
      cfg = config.modules.{};
      ]],
      {
        i(1, "modulesName"),
      }
    )
  ),
}
