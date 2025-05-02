---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.width = 50
    opts.event_handlers = {
      {
        event = "file_opened", -- close neo tree after selecting file
        handler = function() require("neo-tree.command").execute { action = "close" } end,
      },
    }
    return opts
  end,
}
