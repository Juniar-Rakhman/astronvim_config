return {
  "sainnhe/everforest",
  lazy = true,
  priority = 1000,
  init = function()
    local g = vim.g

    g.everforest_background = "hard"
    g.everforest_enable_italic = true
    g.everforest_better_performance = 1
    g.everforest_dim_inactive_windows = true
  end,
}
