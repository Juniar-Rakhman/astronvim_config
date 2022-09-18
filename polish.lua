-- The function below will be executed last
return function()
  -- Set global key binding
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("", "<S-h>", "^", opts)
  keymap("", "<S-l>", "$", opts)

  -- Run auto commands
  require "user.autocmds"
end
