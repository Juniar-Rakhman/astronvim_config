return {
  filetypes = { "typescript", "javascript", "vue", "json" },
  init_options = {
    typescript = {
      tsdk = os.getenv "HOME" .. "/.nvm/versions/node/v17.9.1/lib/node_modules/typescript/lib/",
    },
  },
}
