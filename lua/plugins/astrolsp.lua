---@diagnostic disable: missing-fields
---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      signature_help = false, -- builtin signature help SUCKS!!!
      inlay_hints = true, -- enable inlay hints globally on startup
    },
    autocmds = {
      no_insert_inlay_hints = {
        -- only create for language servers that support inlay hints
        -- (and only if vim.lsp.inlay_hint is available)
        cond = vim.lsp.inlay_hint and "textDocument/inlayHint" or false,
        {
          -- when going into insert mode
          event = "InsertEnter",
          desc = "disable inlay hints on insert",
          callback = function(args)
            local filter = { bufnr = args.buf }
            -- if the inlay hints are currently enabled
            if vim.lsp.inlay_hint.is_enabled(filter) then
              -- disable the inlay hints
              vim.lsp.inlay_hint.enable(false, filter)
              -- create a single use autocommand to turn the inlay hints back on
              -- when leaving insert mode
              vim.api.nvim_create_autocmd("InsertLeave", {
                buffer = args.buf,
                once = true,
                callback = function() vim.lsp.inlay_hint.enable(true, filter) end,
              })
            end
          end,
        },
      },
    },
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
        ["go"] = {
          function() require("telescope.builtin").lsp_incoming_calls { reuse_win = true } end,
          desc = "Incominng Calls",
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
