-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 2, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        autoindent = true, -- sets vim.opt.autoindent
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        winblend = 10, -- sets floating window transparency
        expandtab = true,
        tabstop = 2,
        shiftwidth = 2,
        showtabline = 0,
        cursorline = true,
        cursorcolumn = true,
        formatoptions = "cro",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },

    -- Mappings can be configured through AstroCore as well.
    mappings = {
      [""] = {
        ["<S-h>"] = { "^", desc = "eol" },
        ["<S-l>"] = { "$", desc = "bol" },
      },
      n = {
        ["<leader>b"] = { "<cmd>Neotree buffers<cr>", desc = "Buffer list" },
        ["<Leader>c"] = false, -- c will be used for code related functionalities
        ["<Leader>o"] = { "<cmd>only<cr>", desc = "Only display current window" },
        ["<Leader>q"] = { "<C-w>q", desc = "Quit current window" },

        ["<Leader>w"] = false,
        ["<C-s>"] = { ":w!<cr>", desc = "Save File" },

        -- disable builtin nvim gr* mappings, see remaps in astrolsp.lua
        ["grr"] = false,
        ["grn"] = false,
        ["gra"] = false,
        ["go"] = false,
      },
      v = {
        ["<"] = { "<gv", desc = "Unindent line" },
        [">"] = { ">gv", desc = "Indent line" },
      },
    },
  },
}
