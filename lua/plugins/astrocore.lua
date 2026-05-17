-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      ensure_installed = { "vim", "lua", "vimdoc" },
      incremental_selection = {
        enable = true,
      },
      textobjects = {
        select = {
          select_textobject = {
            ["ak"] = { query = "@block.outer", desc = "around block" },
          },
        },
      },
    },
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = false, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
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
        conceallevel = 1, -- sets vim.opt.conceallevel
        -- autoindent = true, -- sets vim.opt.autoindent
        winblend = 10, -- sets floating window transparency
        pumblend = 10, -- sets popup menu transparency
        expandtab = true,
        showtabline = 1,
        cursorline = true,
        cursorcolumn = true,
        formatoptions = "cro",
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
        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<leader>b"] = { "<cmd>Neotree buffers<cr>", desc = "Buffer list" },
        ["<Leader>c"] = false, -- c will be used for code related functionalities
        ["<Leader>o"] = { "<cmd>only<cr>", desc = "Only display current window" },
        ["<Leader>q"] = { "<C-w>q", desc = "Quit current window" },
        ["<Leader>tn"] = { "<cmd>tabnext<cr>", desc = "Next Tab" },
        ["<Leader>tp"] = { "<cmd>tabprevious<cr>", desc = "Previous Tab" },

        -- Opencode.nvim group
        ["<Leader>O"] = { group = "Opencode" },
        ["<Leader>Ot"] = { function() require("opencode").toggle() end, desc = "Toggle opencode" },
        ["<Leader>OA"] = { function() require("opencode").ask() end, desc = "Ask opencode" },
        ["<Leader>Oa"] = {
          function() require("opencode").ask("@this: ", { submit = true }) end,
          desc = "Ask opencode about this",
        },
        ["<Leader>On"] = { function() require("opencode").command "session_new" end, desc = "New opencode session" },
        ["<Leader>Oy"] = {
          function() require("opencode").command "messages_copy" end,
          desc = "Copy last opencode response",
        },
        ["<S-C-k>"] = {
          function() require("opencode").command "messages_half_page_up" end,
          desc = "Messages half page up",
        },
        ["<S-C-j>"] = {
          function() require("opencode").command "messages_half_page_down" end,
          desc = "Messages half page down",
        },
        ["<Leader>Os"] = { function() require("opencode").select() end, desc = "Select opencode prompt" },
        ["<Leader>Oe"] = {
          function() require("opencode").prompt("Explain @this and its context", { submit = true }) end,
          desc = "Explain this code",
        },
      },
      v = {
        ["<"] = { "<gv", desc = "Unindent line" },
        [">"] = { ">gv", desc = "Indent line" },
        ["p"] = { '"_dP', desc = "Paste without overwriting register" },

        -- Opencode.nvim visual mode
        ["<Leader>Oa"] = {
          function() require("opencode").ask("@this: ", { submit = true }) end,
          desc = "Ask opencode about selection",
        },
        ["<Leader>Os"] = { function() require("opencode").select() end, desc = "Select opencode prompt" },
      },
    },
  },
}
