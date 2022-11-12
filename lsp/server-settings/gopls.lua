local util = require "lspconfig/util"

return {
  root_dir = util.root_pattern("go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        nilness = true,
        unusedresult = true,
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
