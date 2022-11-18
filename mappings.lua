-- This is where you should override builtin mappings
return {
  n = {
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

    ["<A-h>"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" },
    ["<A-l>"] = { "<cmd>bnext<cr>", desc = "Next buffer" },

    ["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Explorer" },
    ["<ESC>"] = { "<cmd>nohlsearch<Bar>:echo<cr>", desc = "Clear" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {},
}
