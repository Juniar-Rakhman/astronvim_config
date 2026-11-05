return {
  "carderne/pi-nvim",
  dependencies = {
    {
      "folke/snacks.nvim",
      opts = {
        input = {
          enabled = true,
        },
      },
    },
  },
  config = function()
    require("pi-nvim").setup {
      set_default_keymaps = false,
    }
  end,
}
