return {

-- -- Center search results
-- keymap("n", "n", "nzz", default_opts)
-- keymap("n", "N", "Nzz", default_opts)
--
-- -- Visual line wraps
-- keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
-- keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

  n = {
    -- disable default bindings
    ["<S-l>"] = false, -- rebind to eol see polish.lua
    ["<S-h>"] = false, -- rebind to bol see polish.lua

    -- TODO: replace with LEAP

    ["<leader>q"] = { "<cmd>Bdelete<cr>", desc = "Close buffer" },
    ["<C-t>"] = { "<cmd>only<cr>", desc = "Close other windows" },

    ["<A-h>"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" },
    ["<A-l>"] = { "<cmd>bnext<cr>", desc = "Next buffer" },

    ["<leader>tb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>tn"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
    ["<leader>tp"] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },
    ["<leader>tq"] = { "<cmd>tabclose<cr>", desc = "Close Tab" },

    ["<leader>e"] = { "<cmd>Neotree float<cr>", desc = "Explorer" },
    ["<ESC>"] = { "<cmd>nohlsearch<Bar>:echo<cr>", desc="Clear"},

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  v = {
    ["<leader>jj"] = { "<cmd>lua require'hop'.hint_char2()<cr>", desc = "Jump to char" },
    ["<leader>jk"] = { "<cmd>lua require'hop'.hint_lines()<cr>", desc = "Jump to line" },
    ["<leader>jp"] = { "<cmd>lua require'hop'.hint_lines()<cr>", desc = "Jump to pattern" },
  },
}

