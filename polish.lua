-- The function below will be executed last
return function()
  -- Set global key binding
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_set_keymap

  keymap("", "<S-h>", "^", opts)
  keymap("", "<S-l>", "$", opts)

  -- highlight yanked text for 200ms using the "Visual" highlight group
  vim.cmd [[
    augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
    augroup END
  ]]

  -- Set autocommands
  vim.api.nvim_create_augroup("packer_conf", { clear = true })
  vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Sync packer after modifying plugins.lua",
    group = "packer_conf",
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
  })
end
