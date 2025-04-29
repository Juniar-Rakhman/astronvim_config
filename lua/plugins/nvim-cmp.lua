---@type LazySpec
return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      preselect = require("cmp").PreselectMode.Item,
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
    },
  },
}
