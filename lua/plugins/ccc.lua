return {
  {
    --- Color picker plugins
    "uga-rosa/ccc.nvim",
    config = function()
      require("ccc").setup {
        -- optional settings
        highlighter = {
          auto_enable = true,
          lsp = true,
        },
      }
    end,
  },
}
