return {
  n = {
    ["<leader>lr"] = { "<cmd>Lspsaga rename<CR>", desc = "Rename current symbol" },

    ["gD"] = false,
    ["gT"] = false,
    ["gr"] = false,

    ["[d"] = false,
    ["]d"] = false,
    ["gl"] = false,
  },
  v = {
    ["<leader>la"] = { function() vim.lsp.buf.range_code_action() end, desc = "Range LSP code action" },
    ["<leader>lf"] = {
      function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, true, true), "n", false)
        vim.lsp.buf.range_formatting()
      end,
      desc = "Range format code",
    },
  },
}
