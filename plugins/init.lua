return {
  -- Disabled plugins
  ["declancm/cinnamon.nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },
  ["antoinemadec/FixCursorHold.nvim"] = { disable = true },
  ["s1n7ax/nvim-window-picker"] = { disable = true },
  ["mrjones2014/smart-splits.nvim"] = { disable = true },
  ["akinsho/bufferline.nvim"] = { disable = true },
  ["akinsho/toggleterm.nvim"] = { disable = true },

  -- Additional Plugins
  ["chaoren/vim-wordmotion"] = { fn = { "<Plug>WordMotion_w" } },
  ["editorconfig/editorconfig-vim"] = {},

  -- Telescope
  ["nvim-telescope/telescope-file-browser.nvim"] = require "user.plugins.telescope-file-browser",
  ["nvim-telescope/telescope-project.nvim"] = require "user.plugins.telescope-project",

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
}
