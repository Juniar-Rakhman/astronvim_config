-- TODO: test this
vim.api.nvim_create_augroup("dapui", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  desc = "Make q close dap floating windows",
  group = "dapui",
  pattern = "dap-float",
  callback = function() vim.keymap.set("n", "q", "<cmd>close!<cr>") end,
})

vim.api.nvim_create_augroup("packer_conf", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  desc = "Sync packer after modifying plugins.lua",
  group = "packer_conf",
  pattern = "plugins/init.lua",
  command = "source <afile> | PackerSync",
})

-- highlight yanked text for 200ms using the "Visual" highlight group

vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=500})
  augroup END
]]
