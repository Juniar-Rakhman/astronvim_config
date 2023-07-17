return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.width = 40
    opts.source_selector = {
      winbar = true, -- toggle to show selector on winbar
      statusline = false,
    }
    opts.event_handlers = {
      {
        event = "file_opened", -- close neo tree after selecting file
        -- handler = function() require("neo-tree").close_all() end,
        handler = function() vim.api.nvim_command "Neotree close" end,
      },
    }
    return opts
  end,
}
