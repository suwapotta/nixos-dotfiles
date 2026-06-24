local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

return {
  s("condition", {
    t("[[ "),
    c(1, {
      t("-"),
      t("! -"),
    }),
    i(2, "d"),
    t(" "),
    i(3, "build/"),
    t(" ]]"),
  }),
}
