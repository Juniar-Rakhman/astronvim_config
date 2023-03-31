return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
      "andymass/vim-matchup",
      init = function() vim.g.matchup_matchparen_deferred = 1 end,
    },
    {
      "HiPhish/nvim-ts-rainbow2",
      config = function()
        vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
          callback = function()
            vim.cmd.TSDisable "rainbow"
            vim.cmd.TSEnable "rainbow"
          end,
        })
      end,
    },
  },
  opts = {
    auto_install = vim.fn.executable "tree-sitter" == 1,
    highlight = { disable = { "help" } },
    matchup = { enable = true },
    rainbow = { enable = true },
    textobjects = {
      lsp_interop = {
        enable = true,
        border = "single",
        peek_definition_code = {
          ["<leader>lp"] = { query = "@function.outer", desc = "Peek function definition" },
          ["<leader>lP"] = { query = "@class.outer", desc = "Peek class definition" },
        },
      },
    },
  },
}
