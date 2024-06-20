return {
  {
    "crispgm/nvim-go",
    event = "BufRead *.go",
    config = function()
      require("go").config.update_tool("quicktype", function(tool) tool.pkg_mgr = "yarn" end)

      -- Main setup. See: https://github.com/crispgm/nvim-go/blob/main/lua/go/config.lua
      require("go").setup {
        -- auto commands
        auto_format = false, -- lsp already formats
        auto_lint = true,

        -- linters: revive, errcheck, staticcheck, golangci-lint
        linter = "golangci-lint",

        -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
        linter_flags = {},

        -- lint_prompt_style: qf (quickfix), vt (virtual text)
        lint_prompt_style = "vt",

        -- formatter: goimports, gofmt, gofumpt
        formatter = "gofumpt",

        -- maintain cursor position after formatting loaded buffer
        maintain_cursor_pos = true,

        -- test flags: -count=1 will disable cache
        test_flags = { "-count-1" },
        test_timeout = "30s",
        test_env = {},

        -- show test result with popup window
        test_popup = true,
        test_popup_auto_leave = false,
        test_popup_width = 100,
        test_popup_height = 100,
      }
    end,
  },
}
