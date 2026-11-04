return {
  "nickjvandyke/opencode.nvim",
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      server = {
        start = function()
          require("snacks.terminal").open("opencode", { win = { position = "right", enter = false } })
        end,
      },
    }
  end,
  dependencies = {
    { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  },
}
