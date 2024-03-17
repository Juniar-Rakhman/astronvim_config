---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    ---@diagnostic disable-next-line: missing-fields
    config = {
      gopls = {
        settings = {
          gopls = {
            analyses = {
              shadow = true,
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
      },
      lua_ls = { settings = { Lua = { hint = { enable = true, arrayIndex = "Disable" } } } },
    },
    mappings = {
      i = {
        ["<C-l>"] = {
          function() vim.lsp.buf.signature_help() end,
          desc = "Signature help",
          cond = "textDocument/signatureHelp",
        },
      },
    },
  },
}
