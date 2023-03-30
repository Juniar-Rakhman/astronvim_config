return {
  ------------------- Disabled plugins -----------------
  ["max397574/better-escape.nvim"] = { disable = true },
  ["Darazaki/indent-o-matic"] = { disable = true },
  ["akinsho/bufferline.nvim"] = { disable = true },
  ["rebelot/heirline.nvim"] = { disable = true },
  ["stevearc/aerial.nvim"] = { disable = true },
  ------------------------------------------------------

  ["ghillb/cybu.nvim"] = {
    -- branch = "main", -- timely updates
    branch = "v1.x", -- won't receive breaking changes
    requires = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" }, -- optional for icon support
    config = function()
      require("user.plugins.cybu").setup()
      vim.keymap.set("n", "<A-h>", "<Plug>(CybuPrev)")
      vim.keymap.set("n", "<A-l>", "<Plug>(CybuNext)")
    end,
  },

  -- Statusline
  ["feline-nvim/feline.nvim"] = {
    after = "nvim-web-devicons",
    config = function() require("user.plugins.feline").setup() end,
  },

  -- winbar
  ["Juniar-Rakhman/barbecue.nvim"] = {
    requires = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup {
        show_navic = true,
        attach_navic = true,
        create_autocmd = true,
        include_buftypes = { "" },
        exclude_filetypes = { "toggleterm", "^neo%-tree$" },
        modifiers = {
          dirname = ":~:.",
          basename = "",
        },
        custom_section = function() return "" end,
        theme = "auto",
        show_modified = false,
        symbols = {
          modified = "●",
          ellipsis = "…",
          separator = "",
        },
        kinds = {
          Array = "",
          Boolean = "蘒",
          Class = "",
          Color = "",
          Constant = "",
          Constructor = "",
          Enum = "",
          EnumMember = "",
          Event = "",
          Field = "",
          File = "",
          Folder = "",
          Function = "",
          Interface = "",
          Key = "",
          Keyword = "",
          Method = "",
          Module = "",
          Namespace = "",
          Null = "ﳠ",
          Number = "",
          Object = "",
          Operator = "",
          Package = "",
          Property = "",
          Reference = "",
          Snippet = "",
          String = "",
          Struct = "",
          Text = "",
          TypeParameter = "",
          Unit = "",
          Value = "",
          Variable = "",
        },
      }
    end,
  },

  ["chaoren/vim-wordmotion"] = { fn = { "<Plug>WordMotion_w" } },

  -- Better syntax highlighting
  -- ["David-Kunz/markid"] = {},

  ["EdenEast/nightfox.nvim"] = {
    module = "nightfox",
    event = "ColorScheme",
    config = function() require "user.plugins.nightfox" end,
  },

  ["ray-x/lsp_signature.nvim"] = {
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  ["lvimuser/lsp-inlayhints.nvim"] = {
    config = function() require("user.plugins.lsp-inlayhints").setup() end,
  },

  ["williamboman/mason-lspconfig.nvim"] = { ensure_installed = { "gopls", "jdtls" } }, -- install jdtls

  -- Typescript
  ["jose-elias-alvarez/typescript.nvim"] = {
    after = "mason-lspconfig.nvim",
    config = function() require "user.plugins.typescript" end,
  },

  -- Golang --
  ["crispgm/nvim-go"] = {
    module = "go",
    event = "BufRead *.go",
    config = function() require("user.plugins.nvim-go").setup() end,
  },

  -- Java --
  -- LSP setup is skipped. See config in autocmds.lua
  ["mfussenegger/nvim-jdtls"] = { module = "jdtls" },

  -- Jumping around --
  ["phaazon/hop.nvim"] = {
    branch = "v2", -- optional but strongly recommended
    config = function() require("hop").setup { keys = "etovxqpdygfblzhckisuran" } end,
  },

  -- Multi cursor --
  ["mg979/vim-visual-multi"] = {},

  ["leoluz/nvim-dap-go"] = {
    module = "dap-go",
    config = function() require("dap-go").setup() end,
  }, -- Debug Golang

  -- Additional Telescope plugins
  ["nvim-telescope/telescope-symbols.nvim"] = {},
}
