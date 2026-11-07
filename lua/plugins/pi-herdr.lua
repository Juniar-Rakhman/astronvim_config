return {
  "Juniar-Rakhman/pi-herdr",
  lazy = false,
  opts = {
    submit_after_send = true,
  },
  config = function(_, opts)
    require("pi-herdr").setup(opts)

    vim.keymap.set(
      "n",
      "<leader>Oa",
      function() require("pi-herdr").ask("@this: ", { mode = "n" }) end,
      { desc = "Ask Pi about this line" }
    )
    vim.keymap.set("v", "<leader>Oa", function()
      local snapshot = require("pi-herdr").capture_context { mode = "v" }
      require("pi-herdr").ask("@this: ", { mode = "v", context = snapshot })
    end, { desc = "Ask Pi selection" })
    vim.keymap.set("n", "<leader>Ob", function() require("pi-herdr").ask_buffer() end, { desc = "Ask Pi about buffer" })
    vim.keymap.set("n", "<leader>Os", function() require("pi-herdr").select() end, { desc = "Select Pi prompt" })
  end,
}

