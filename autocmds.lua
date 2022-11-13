vim.api.nvim_create_augroup("dapui", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  desc = "Make q close dap floating windows",
  group = "dapui",
  pattern = "dap-float",
  callback = function() vim.keymap.set("n", "q", "<cmd>close!<cr>") end,
})

-- vim.api.nvim_create_augroup("packer_conf", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   desc = "Sync packer after modifying plugins.lua",
--   group = "packer_conf",
--   pattern = "*/.config/**/*/plugins/init.lua",
--   command = "source <afile> | PackerSync",
-- })

-- highlight yanked text using "IncSearch" highlight group
vim.cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=500})
  augroup END
]]

-- Attach lsp-inlayhints to current buffer
vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then return end
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, bufnr)
  end,
})

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

-- autocmd to start jdtls
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "java",
  callback = function()
    -- jdtls setup is skipped in lsp config. Do it here instead.
    local config = astronvim.lsp.server_settings "jdtls"
    if config.root_dir and config.root_dir ~= "" then require("jdtls").start_or_attach(config) end

    -- Keymap for Java --

    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then return end

    local mappings = {
      c = {
        o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
        v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
        c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
        t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
        T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
        u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
      },
    }

    local vmappings = {
      c = {
        v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
        c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
        m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
      },
    }

    which_key.register(mappings, opts)
    which_key.register(vmappings, vopts)
  end,
})

-- automcd for gopls
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    -- Keymap for Go --
    local status_ok, which_key = pcall(require, "which-key")
    if not status_ok then return end

    local mappings = {
      c = {
        name = "Code",
        i = { "<cmd>GoInstallBinaries<Cr>", "Install Go Binaries" },
        a = { "<cmd>GoAddTest<Cr>", "Add Test" },
        L = { "<cmd>GoLint<Cr>", "Go Lint" },
        t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
      },
    }

    which_key.register(mappings, opts)
  end,
})
