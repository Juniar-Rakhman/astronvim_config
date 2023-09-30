return {
  {
    "ghillb/cybu.nvim",
    lazy = false,
    cmd = "Cybu",
    event = "BufRead",
    config = function()
      require("cybu").setup {
        position = {
          relative_to = "editor", -- win, editor, cursor
          anchor = "topcenter", -- topleft, topcenter, topright,
          -- vertical_offset = 10, -- vertical offset from anchor in lines
          -- horizontal_offset = 0, -- vertical offset from anchor in columns
          max_win_height = 10, -- height of cybu window in lines
          max_win_width = 0.7, -- integer for absolute in columns, float for relative width to window
        },
        display_time = 750, -- time the cybu window is displayed
        style = {
          path = "relative", -- absolute, relative, tail (filename only)
          border = "rounded", -- single, double, rounded, none
          separator = " ", -- string used as separator
          prefix = "…", -- string used as prefix for truncated paths
          padding = 1, -- left & right padding in number of spaces
          hide_buffer_id = true,
          devicons = {
            enabled = true, -- enable or disable web dev icons
            colored = true, -- enable color for web dev icons
          },
          highlights = { -- see highlights via :highlight
            current_buffer = "CybuFocus", -- current / selected buffer
            adjacent_buffers = "CybuAdjacent", -- buffers not in focus
            background = "CybuBackground", -- window background
            border = "CybuBorder", -- border of the window
          },
        },
      }
      vim.keymap.set("n", "<A-h>", "<Plug>(CybuPrev)")
      vim.keymap.set("n", "<A-l>", "<Plug>(CybuNext)")
      -- vim.keymap.set({ "n", "v" }, "<c-s-tab>", "<plug>(CybuLastusedPrev)")
      -- vim.keymap.set({ "n", "v" }, "<c-tab>", "<plug>(CybuLastusedNext)")
    end,
  },
}
