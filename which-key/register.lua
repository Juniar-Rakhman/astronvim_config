return {
  n = {
    ["<leader>"] = {
      D = { nil },
      d = {
        name = "Debugger",
      },
      ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
      ["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },

      c = {
        name = "Code", -- will be populated with language specific functionalities
      },

      f = {
        name = "Finder",
        ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        n = { "<cmd>Telescope notify<cr>", "Notifications" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        e = { "<cmd>Telescope symbols<cr>", "Emojis" },
        s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Dynamic Workspace Symbols" },
      },

      j = {
        name = "Jump",
        j = { function() require("hop").hint_char2() end, "Jump 2 char" },
        l = { function() require("hop").hint_lines() end, "Jump line" },
      },

      T = {
        name = "Tab",
        b = { "<cmd>tabnew<cr>", "New tab" },
        c = { "<cmd>tabclose<cr>", "Close tab" },
        n = { "<cmd>tabnext<cr>", "Next Tab" },
        p = { "<cmd>tabprevious<cr>", "Previous Tab" },
        q = { "<cmd>tabclose<cr>", "Close Tab" },
      },
    },

    ["]"] = {
      d = "Next diagnostic",
    },

    ["["] = {
      d = "Previous diagnostic",
    },

    ["g"] = {
      i = { "<cmd>Telescope lsp_implementations<cr>", "Go to [i]mplementations" },
    },
  },
  i = {
    ["<c-d>"] = {
      n = { "<c-r>=strftime('%Y-%m-%d')<cr>", "Y-m-d" },
      x = { "<c-r>=strftime('%m/%d/%y')<cr>", "m/d/y" },
      f = { "<c-r>=strftime('%B %d, %Y')<cr>", "B d, Y" },
      X = { "<c-r>=strftime('%H:%M')<cr>", "H:M" },
      F = { "<c-r>=strftime('%H:%M:%S')<cr>", "H:M:S" },
      d = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", "Y/m/d H:M:S -" },
    },
  },
  v = {},
}
