-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
--

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = false, virtual_lines = true }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap

        autoindent = true, -- sets vim.opt.autoindent
        winblend = 10, -- sets floating window transparency
        expandtab = true,
        tabstop = 2,
        shiftwidth = 2,
        showtabline = 1,
        cursorline = true,
        cursorcolumn = true,
        formatoptions = "cro",
        -- guicursor = "a:blinkon100",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        netrw_browsex_viewer = "/Applications/Arc.app",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      [""] = {
        ["<S-h>"] = { "^", desc = "eol" },
        ["<S-l>"] = { "$", desc = "bol" },
      },
      n = {
        -- disable builtin nvim gr* mappings, see remaps in astrolsp.lua
        ["grr"] = false,
        ["grn"] = false,
        ["gra"] = false,
        -- will be used for something else
        ["go"] = false,

        -- navigate buffer tabs
        ["<leader>b"] = { "<cmd>Neotree buffers<cr>", desc = "Buffer list" },
        ["<Leader>c"] = false, -- c will be used for code related functionalities
        ["<Leader>o"] = { "<cmd>only<cr>", desc = "Only display current window" },
        ["<Leader>q"] = { "<C-w>q", desc = "Quit current window" },
        ["<Leader>tn"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
        ["<Leader>tp"] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },
      },
      v = {
        ["<"] = { "<gv", desc = "Unindent line" },
        [">"] = { ">gv", desc = "Indent line" },
        ["p"] = { '"_dP', desc = "Paste without overwriting register" },
      },
    },
  },
}
