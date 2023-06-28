return {
  {
    "crispgm/nvim-go",
    event = "BufRead *.go",
    config = function()
      require("go").config.update_tool("quicktype", function(tool) tool.pkg_mgr = "yarn" end)

      -- Main setup
      require("go").setup {
        -- notify: use nvim-notify
        notify = false,
        -- auto commands
        auto_format = false, -- lsp already formats
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
        test_popup_height = 100,
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
    end,
  },
}
