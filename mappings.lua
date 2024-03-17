-- Mapping data with "desc" stored directly by vim.keymap.set().
return {
  -- first key is the mode
  n = {
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { "<cmd>Neotree buffers<cr>", desc = "Buffer list" },

    ["<leader>b\\"] = { false },
    ["<leader>b|"] = { false },
    ["<leader>bb"] = { false },
    ["<leader>bC"] = { false },
    ["<leader>bc"] = { false },
    ["<leader>bD"] = { false },
    ["<leader>bd"] = { false },
    ["<leader>bl"] = { false },
    ["<leader>bp"] = { false },
    ["<leader>br"] = { false },
    ["<leader>bs"] = { false },
    ["<leader>bse"] = { false },
    ["<leader>bsr"] = { false },
    ["<leader>bsp"] = { false },
    ["<leader>bsi"] = { false },
    ["<leader>bsm"] = { false },

    -- ["<A-h>"] = { "<cmd>bprevious<cr>", desc = "Previous Buffer" },
    -- ["<A-l>"] = { "<cmd>bnext<cr>", desc = "Next Buffer" },

    ["<leader>c"] = { false }, -- will be used for code related functionalities

    ["<leader>o"] = { "<cmd>only<cr>", desc = "Only display current window" },
    ["<leader>q"] = { "<C-w>q", desc = "Quit current window" },
  },
  v = {
    ["<"] = { "<gv", desc = "Unindent line" },
    [">"] = { ">gv", desc = "Indent line" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
