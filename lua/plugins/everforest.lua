return {
  "neanias/everforest-nvim",
  lazy = true,
  priority = 1000,
  init = function()
    require("everforest").setup {
      background = "soft",
      italics = true,
      dim_inactive_windows = true,
    }
  end,
}
