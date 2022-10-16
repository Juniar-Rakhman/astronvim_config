local dap = require "dap"
local dapui = require "dapui"
local dapwidgets = require "dap.ui.widgets"

return {
  n = {
    ["<leader>"] = {
      ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
      ["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },

      f = {
        name = "Finder",
        ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        n = { "<cmd>Telescope notify<cr>", "Notifications" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
        e = { "<cmd>Telescope symbols<cr>", "Emojis" },
      },

      d = {
        name = "Debug",
        R = { function() dap.run_to_cursor() end, "Run to Cursor" },
        C = { function() dap.set_breakpoint(vim.fn.input "[Condition] > ") end, "Conditional Breakpoint" },
        b = { function() dap.step_back() end, "Step Back" },
        c = { function() dap.continue() end, "Continue" },
        d = { function() dap.disconnect() end, "Disconnect" },
        g = { function() dap.session() end, "Get Session" },
        i = { function() dap.step_into() end, "Step Into" },
        o = { function() dap.step_over() end, "Step Over" },
        p = { function() dap.pause.toggle() end, "Pause" },
        q = { function() dap.close() end, "Quit" },
        r = { function() dap.repl.toggle() end, "Toggle Repl" },
        s = { function() dap.continue() end, "Start" },
        t = { function() dap.toggle_breakpoint() end, "Toggle Breakpoint" },
        x = { function() dap.terminate() end, "Terminate" },
        u = { function() dap.step_out() end, "Step Out" },
        e = { function() dapui.eval() end, "Evaluate" },
        U = { function() dapui.toggle() end, "Toggle UI" },
        E = { function() dapui.eval(vim.fn.input "[Expression] > ") end, "Evaluate Input" },
        h = { function() dapwidgets.hover() end, "Hover Variables" },
        S = { function() dapwidgets.scopes() end, "Scopes" },
      },

      j = {
        name = "Jump",
        j = { function() require("hop").hint_char2() end, "Jump 2 char" },
        l = { function() require("hop").hint_lines() end, "Jump line" },
      },

      t = {
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
      r = { "<cmd>Telescope lsp_references<cr>", "References" },
      i = { "<cmd>Telescope lsp_implementations<cr>", "Implementation" },
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
  v = {
    ["<leader>"] = {
      d = {
        name = "Debugger",
        e = { function() require("dapui").eval() end, "Evaluate Line" },
      },

      j = {
        name = "Jump",
        j = { function() require("hop").hint_char2() end, "Jump 2 char" },
        l = { function() require("hop").hint_lines() end, "Jump line" },
      },
    },
  },
}
