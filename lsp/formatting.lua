return {
  format_on_save = {
    enabled = true, -- enable or disable format on save globally
    allow_filetypes = { -- enable format on save for specified filetypes only
      "java",
      "go",
    },
    -- ignore_filetypes = { -- disable format on save for specified filetypes
    --   -- "python",
    -- },
  },
  disabled = { -- disable formatting capabilities for the listed language servers
    "sumneko_lua", -- use stylua
    -- "jdtls",
  },
  timeout_ms = 1000, -- default format timeout
  -- filter = function(client) -- fully override the default formatting function
  --   return true
  -- end
}
