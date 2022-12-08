return {
  -- Disabled plugins
  ["max397574/better-escape.nvim"] = { disable = true },

  ["chaoren/vim-wordmotion"] = { fn = { "<Plug>WordMotion_w" } },

  -- Better syntax highlighting
  ["David-Kunz/markid"] = {},

  -- ["sainnhe/everforest"] = {},

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

  -- Additional Telescope plugins
  ["nvim-telescope/telescope-symbols.nvim"] = {},

  -- Debugging
  ["mfussenegger/nvim-dap"] = {
    opt = true,
    event = "BufReadPre",
    module = { "dap" },
    wants = {
      "nvim-dap-virtual-text",
      "DAPInstall.nvim",
      "nvim-dap-ui",
      "which-key.nvim",
    },
    requires = {
      "Pocco81/DAPInstall.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      { "leoluz/nvim-dap-go", module = "dap-go" }, -- Debug Golang
    },
    config = function() require("user.plugins.dap").setup() end,
  },

  -- Editor Config
  ["gpanders/editorconfig.nvim"] = {},
}
