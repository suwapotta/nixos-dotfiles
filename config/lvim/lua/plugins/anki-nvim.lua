if true then
  return {}
end

return {
  "rareitems/anki.nvim",

  lazy = false,
  opts = {
    tex_support = true,

    models = {
      ["BetterClozeSans"] = "Semester 252::Programming Fundamentals",
      ["BetterClozeCode"] = "Semester 252::Programming Fundamentals",
    },
  },
}
