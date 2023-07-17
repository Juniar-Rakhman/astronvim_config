return {
  filetypes = { "typescript", "javascript", "vue", "json" },
  -- filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
  init_options = {
    typescript = {
      --TODO :
      -- tsdk = "/usr/local/lib/node_modules/typescript/lib",
      tsdk = os.getenv "HOME" .. "/.nvm/versions/node/v17.9.1/lib/node_modules/typescript/lib/",
    },
  },
}
