return {
  -- Disabled plugins
  ["declancm/cinnamon.nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },
  ["antoinemadec/FixCursorHold.nvim"] = { disable = true },
  ["s1n7ax/nvim-window-picker"] = { disable = true },
  ["mrjones2014/smart-splits.nvim"] = { disable = true },
  ["akinsho/bufferline.nvim"] = { disable = true },
  ["akinsho/toggleterm.nvim"] = { disable = true },
  ["goolord/alpha-nvim"] = { disable = true },

  -- Additional Plugins
  ["chaoren/vim-wordmotion"] = { fn = { "<Plug>WordMotion_w" } },
  ["mhinz/vim-startify"] = {},
  ["sainnhe/everforest"] = {},
  ["ray-x/lsp_signature.nvim"] = {
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  ["simrat39/inlay-hints.nvim"] = {
    config = function()
      require("inlay-hints").setup {
        renderer = "inlay-hints/render/eol",
        only_current_line = false,
        hints = {
          parameter = {
            show = false,
            highlight = "Comment",
          },
          type = {
            show = false,
            highlight = "Comment",
          },
        },
      }
    end,
  },

  -- Golang --
  -- ["ray-x/go.nvim"] = {
  --   config = function() require("user.plugins.go-nvim").setup() end,
  -- },
  ["crispgm/nvim-go"] = {
    config = function() require("user.plugins.nvim-go").setup() end,
  },

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
      { "jbyuki/one-small-step-for-vimkind", module = "osv" }, -- Debug Lua
    },
    config = function() require("user.plugins.dap").setup() end,
  },

  -- Testing
  ["NTBBloodbath/rest.nvim"] = {
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup {
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to nil if you want to disable them
          formatters = {
            json = "jq",
            html = function(body) return vim.fn.system({ "tidy", "-i", "-q", "-" }, body) end,
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
      }
    end,
  },
}
