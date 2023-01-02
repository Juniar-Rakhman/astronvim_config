return {
  ------------------- Disabled plugins -----------------
  ["max397574/better-escape.nvim"] = { disable = true },
  ["Darazaki/indent-o-matic"] = { disable = true },
  ["akinsho/bufferline.nvim"] = { disable = true },
  ["rebelot/heirline.nvim"] = { disable = true },
  ------------------------------------------------------

  -- Statusline
  ["feline-nvim/feline.nvim"] = {
    after = "nvim-web-devicons",
    config = function() require("user.plugins.feline").setup() end,
  },

  ["SmiteshP/nvim-navic"] = {
    requires = "neovim/nvim-lspconfig",
  },

  ["chaoren/vim-wordmotion"] = { fn = { "<Plug>WordMotion_w" } },

  -- Better syntax highlighting
  ["David-Kunz/markid"] = {},

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
