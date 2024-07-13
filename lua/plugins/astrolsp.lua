---@diagnostic disable: missing-fields
---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
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
      volar = {
        filetypes = { "typescript", "javascript", "vue", "json" },
        init_options = {
          typescript = {
            tsdk = os.getenv "HOME" .. "/.nvm/versions/node/v17.9.1/lib/node_modules/typescript/lib/",
          },
        },
      },
    },
    formatting = {
      format_on_save = {
        enabled = true,
      },
      -- disable formatting capabilities for specific language servers
      disabled = {
        "lua_ls",
        "volar", -- use prettier
        "eslint_d", -- use prettier
      },
      -- default format timeout
      timeout_ms = 1000,
    },
    mappings = {
      n = {
        K = {
          function() vim.lsp.buf.hover() end,
          desc = "Hover symbol details",
        },
        ["gd"] = {
          function() require("telescope.builtin").lsp_definitions { reuse_win = true } end,
          desc = "Go to definitions",
        },
        ["gr"] = {
          function() require("telescope.builtin").lsp_references { reuse_win = true } end,
          desc = "Go to references",
        },
        ["gy"] = {
          function() require("telescope.builtin").lsp_type_definitions { reuse_win = true } end,
          desc = "Go to type definition",
        },
        ["gI"] = {
          function() require("telescope.builtin").lsp_implementations { reuse_win = true } end,
          desc = "Go to implementations",
        },
      },
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
