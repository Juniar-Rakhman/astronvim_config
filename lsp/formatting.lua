return {
  format_on_save = {
    enabled = true, -- enable or disable format on save globally
  },
  disabled = { -- disable formatting capabilities for the listed language servers
    "sumneko_lua", -- use stylua
    -- "jdtls",
  },
  timeout_ms = 1000, -- default format timeout
}
