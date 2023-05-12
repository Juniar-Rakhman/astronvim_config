return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.width = 50
    opts.source_selector = {
      winbar = true, -- toggle to show selector on winbar
      statusline = false,
      sources = {
        { source = "filesystem" },
        { source = "buffers" },
        { source = "git_status" },
      },
    }
    opts.event_handlers = {
      { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
      {
        event = "file_opened",
        handler = function() require("neo-tree").close_all() end,
      },
    }
    return opts
  end,
}
