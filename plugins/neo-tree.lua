return {
  window = {
    width = 50,
    mappings = {
      ["o"] = "open",
    },
  },
  enable_diagnostics = false,
  event_handlers = {
    { event = "neo_tree_buffer_enter", handler = function(_) vim.opt_local.signcolumn = "auto" end },
    {
      event = "file_opened",
      handler = function() require("neo-tree").close_all() end,
    },
  },
}
