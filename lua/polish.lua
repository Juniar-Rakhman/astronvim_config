-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

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

-- Enable Java specific keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.java",
  group = vim.api.nvim_create_augroup("code_keymap_java", { clear = true }),
  callback = function(_) require "plugins.java.keymaps" end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("Lsp_signature", { clear = true }),
--   callback = function(args)
--     local bufnr = args.buf
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if vim.tbl_contains({ "null-ls" }, client.name) then -- blacklist lsp
--       return
--     end
--
--     require("lsp_signature").on_attach({
--       -- ... setup options here ...
--       bind = true, -- This is mandatory, otherwise border config won't get registered.
--       handler_opts = {
--         border = "rounded",
--       },
--     }, bufnr)
--   end,
-- })
