-- This is where you should override builtin mappings
return {
  n = {
    ["f"] = { function() require("hop").hint_char2() end, desc = "Jump 2 char" },

    -- disable default bindings
    ["<leader>c"] = false,
    ["<leader>d"] = false,
    ["<leader>h"] = false,
    ["<leader>o"] = false,
    ["<leader>s"] = false,

    ["<C-\\>"] = false,
    ["<leader>fh"] = false,
    ["<leader>fm"] = false,
    ["<leader>fn"] = false,
    ["<leader>fo"] = false,

    ["<leader>D"] = false,
    ["<leader>Db"] = false,
    ["<leader>DB"] = false,
    ["<leader>Dc"] = false,
    ["<leader>Di"] = false,
    ["<leader>Do"] = false,
    ["<leader>DO"] = false,
    ["<leader>Dq"] = false,
    ["<leader>DQ"] = false,
    ["<leader>Dp"] = false,
    ["<leader>Dr"] = false,
    ["<leader>DR"] = false,

    ["<leader>Du"] = false,
    ["<leader>Dh"] = false,

    ["<S-l>"] = false, -- rebind to eol see polish.lua
    ["<S-h>"] = false, -- rebind to bol see polish.lua

    -- center search result
    ["<n>"] = { "nzz", desc = "Next result" },
    ["<N>"] = { "Nzz", desc = "Previous result" },

    -- easy splits
    ["\\"] = { "<cmd>split<cr>", desc = "Horizontal split" },
    ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" },

    ["<leader>q"] = { "<cmd>Bdelete<cr>", desc = "Close buffer" },
    ["<C-t>"] = { "<cmd>only<cr>", desc = "Close other windows" },
    ["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Explorer" },
    ["<ESC>"] = { "<cmd>nohlsearch<Bar>:echo<cr>", desc = "Clear" },

    -- Debug
    ["<leader>db"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint (F9)" },
    ["<leader>dB"] = { function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoints" },
    ["<leader>dc"] = { function() require("dap").continue() end, desc = "Start/Continue (F5)" },
    ["<leader>di"] = { function() require("dap").step_into() end, desc = "Step Into (F11)" },
    ["<leader>do"] = { function() require("dap").step_over() end, desc = "Step Over (F10)" },
    ["<leader>dO"] = { function() require("dap").step_out() end, desc = "Step Out (S-F11)" },
    ["<leader>dq"] = { function() require("dap").close() end, desc = "Close Session" },
    ["<leader>dQ"] = { function() require("dap").terminate() end, desc = "Terminate Session (S-F5)" },
    ["<leader>dp"] = { function() require("dap").pause() end, desc = "Pause (F6)" },
    ["<leader>dr"] = { function() require("dap").restart_frame() end, desc = "Restart (C-F5)" },
    ["<leader>dR"] = { function() require("dap").repl.toggle() end, desc = "Toggle REPL" },

    ["<leader>du"] = { function() require("dapui").toggle() end, desc = "Toggle Debugger UI" },
    ["<leader>dh"] = { function() require("dap.ui.widgets").hover() end, desc = "Debugger Hover" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["f"] = { function() require("hop").hint_char2() end, desc = "Jump 2 char" },
  },
}
