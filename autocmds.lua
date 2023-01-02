vim.api.nvim_create_augroup("dapui", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  desc = "Make q close dap floating windows",
  group = "dapui",
  pattern = "dap-float",
  callback = function() vim.keymap.set("n", "q", "<cmd>close!<cr>") end,
})

-- Attach lsp-inlayhints to current buffer
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then return end
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
    -- local navic = require "nvim-navic"
    -- if client.server_capabilities.documentSymbolProvider then navic.attach(client, bufnr) end
  end,
})

-- autocmd to start jdtls
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "java",
  callback = function() require("user.autocmds.java").attach() end,
})

-- automcd for gopls
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function() require("user.autocmds.go").attach() end,
})
