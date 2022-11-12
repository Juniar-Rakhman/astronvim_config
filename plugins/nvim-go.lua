local M = {}

function M.setup()
  -- Setup keymaps
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then return end

  local opts = {
    mode = "n", -- NORMAL mode prefix = "<leader>", buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }

  local mappings = {
    C = {
      name = "Code",
      i = { "<cmd>GoInstallBinaries<Cr>", "Install Go Binaries" },
      a = { "<cmd>GoAddTest<Cr>", "Add Test" },
      L = { "<cmd>GoLint<Cr>", "Go Lint" },
      t = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" },
    },
  }

  which_key.register(mappings, opts)

  -- quick type setup
  require("go").config.update_tool("quicktype", function(tool) tool.pkg_mgr = "yarn" end)

  -- Main setup
  require("go").setup {
    -- notify: use nvim-notify
    notify = false,
    -- auto commands
    auto_format = false,
    auto_lint = false,
    -- linters: revive, errcheck, staticcheck, golangci-lint
    linter = "revive", -- this is annoying to enable
    -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
    linter_flags = {},
    -- lint_prompt_style: qf (quickfix), vt (virtual text)
    lint_prompt_style = "vt",
    -- formatter: goimports, gofmt, gofumpt
    formatter = "gofumpt",
    -- maintain cursor position after formatting loaded buffer
    maintain_cursor_pos = true,
    -- test flags: -count=1 will disable cache
    test_flags = { "-v" },
    test_timeout = "30s",
    test_env = {},
    -- show test result with popup window
    test_popup = true,
    test_popup_auto_leave = false,
    test_popup_width = 100,
    test_popup_height = 10,
    -- test open
    test_open_cmd = "edit",
    -- struct tags
    tags_name = "json",
    tags_options = { "json=omitempty" },
    tags_transform = "snakecase",
    tags_flags = { "-skip-unexported" },
    -- quick type
    quick_type_flags = { "--just-types" },
  }
end

return M
