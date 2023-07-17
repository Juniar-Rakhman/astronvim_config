-- vim.api.nvim_create_autocmd("VimLeave", {
--   desc = "Stop running auto compiler",
--   group = vim.api.nvim_create_augroup("autocomp", { clear = true }),
--   pattern = "*",
--   callback = function() vim.fn.jobstart { "autocomp", vim.fn.expand "%:p", "stop" } end,
-- })

-- text like documents enable wrap and spell
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
  command = "set formatoptions-=cro",
})

-- sort buffer by number
vim.api.nvim_create_autocmd("User", {
  pattern = "AstroBufsUpdated",
  group = vim.api.nvim_create_augroup("auto_sort_tabline", { clear = true }),
  callback = function() require("astronvim.utils.buffer").sort("bufnr", true) end,
})
