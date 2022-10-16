local util = require "lspconfig/util"
-- local ih = require "inlay-hints" -- Using inlay-hints plugins. see plugins/init.lua

return {
  root_dir = util.root_pattern("go.mod", ".git"),
  -- on_attach = function(c, b) ih.on_attach(c, b) end,
  settings = {
    gopls = {
      analyses = {
        shadow = true,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
        unreachable = true,
      },
      experimentalPostfixCompletions = true,
      gofumpt = true,
      staticcheck = true,
      usePlaceholders = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
