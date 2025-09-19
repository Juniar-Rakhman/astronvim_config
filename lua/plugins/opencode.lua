return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for better prompt input, and required to use `opencode.nvim`'s embedded terminal — otherwise optional
    { "folke/snacks.nvim", opts = { input = { enabled = true } } },
  },
}
