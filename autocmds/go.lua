M = {}

-- Options for language specific keymap
local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

function M.attach()
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
end

return M
