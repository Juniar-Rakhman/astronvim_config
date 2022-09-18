return {
  n = {
    ["<leader>"] = {
      ["c"] = { "<cmd>bdelete<cr>", "Close Buffer" },
      ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
      ["H"] = { "<cmd>set hlsearch!<cr>", "Toggle Highlight" },

      f = {
        name = "Finder",
        ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
        e = { "<cmd>Telescope file_browser<cr>", "Explorer" },
        h = { "<cmd>Telescope oldfiles<cr>", "History" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        n = { "<cmd>Telescope notify<cr>", "Notifications" },
        p = { "<cmd>Telescope project<cr>", "Projects" },
        r = { "<cmd>Telescope registers<cr>", "Registers" },
      },

      d = {
        name = "Debug",
        R = { function() require("dap").run_to_cursor() end, "Run to Cursor" },
        C = { function() require("dap").set_breakpoint(vim.fn.input "[Condition] > ") end, "Conditional Breakpoint" },
        b = { function() require("dap").step_back() end, "Step Back" },
        c = { function() require("dap").continue() end, "Continue" },
        d = { function() require("dap").disconnect() end, "Disconnect" },
        g = { function() require("dap").session() end, "Get Session" },
        i = { function() require("dap").step_into() end, "Step Into" },
        o = { function() require("dap").step_over() end, "Step Over" },
        p = { function() require("dap").pause.toggle() end, "Pause" },
        q = { function() require("dap").close() end, "Quit" },
        r = { function() require("dap").repl.toggle() end, "Toggle Repl" },
        s = { function() require("dap").continue() end, "Start" },
        t = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint" },
        x = { function() require("dap").terminate() end, "Terminate" },
        u = { function() require("dap").step_out() end, "Step Out" },
        e = { function() require("dapui").eval() end, "Evaluate" },
        U = { function() require("dapui").toggle() end, "Toggle UI" },
        E = { function() require("dapui").eval(vim.fn.input "[Expression] > ") end, "Evaluate Input" },
        h = { function() require("dap.ui.widgets").hover() end, "Hover Variables" },
        S = { function() require("dap.ui.widgets").scopes() end, "Scopes" },
      },
    },

    ["]"] = {
      f = "Next function start",
      x = "Next class start",
      F = "Next function end",
      X = "Next class end",
    },

    ["["] = {
      f = "Previous function start",
      x = "Previous class start",
      F = "Previous function end",
      X = "Previous class end",
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
    },
  },
}
