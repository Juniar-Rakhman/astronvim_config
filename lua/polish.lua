-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

-- for text like documents enable wrap and spell
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown", "text", "plaintex" },
  group = vim.api.nvim_create_augroup("auto_spell", { clear = true }),
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- https://github.com/AstroNvim/AstroNvim/issues/1593
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  desc = "Disable comment continuation",
  group = vim.api.nvim_create_augroup("disable_comment_continuation", { clear = true }),
  command = "set formatoptions-=cro",
})

vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*",
  desc = "Enable Codeium on startup",
  group = vim.api.nvim_create_augroup("auto_codeium", { clear = true }),
  callback = function() vim.api.nvim_command "Codeium Enable" end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.java",
  group = vim.api.nvim_create_augroup("code_keymap_java", { clear = true }),
  callback = function(args) require "plugins.java.keymaps" end,
})
