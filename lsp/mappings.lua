return {
  n = {
    ["gT"] = false, -- unused
    ["gr"] = false, -- replaced with telescope lsp_references
    ["gl"] = false, -- redundant
    ["gd"] = { "<cmd>Telescope lsp_definitions<cr>", desc = "Show the definition of current symbol" },
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
