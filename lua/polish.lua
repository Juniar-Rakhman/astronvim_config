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

-- FIX: https://github.com/AstroNvim/AstroNvim/issues/1593
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

-- On startup change working directory to current folder / file
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0)
    if not arg then return end

    local stat = vim.loop.fs_stat(arg)
    if not stat then return end

    if stat.type == "directory" then
      vim.cmd.cd(arg)
    elseif stat.type == "file" then
      vim.cmd.cd(vim.fn.fnamemodify(arg, ":h"))
    end
  end,
})

-- Enable Java specific keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.java",
  group = vim.api.nvim_create_augroup("code_keymap_java", { clear = true }),
  callback = function(_) require "plugins.java.keymaps" end,
})

-- TODO: enable Go specific keymaps

-- TODO: enable Rust specific keymaps

-- TODO: enable JS specific keymaps

-- TODO: enable JS specific keymaps
