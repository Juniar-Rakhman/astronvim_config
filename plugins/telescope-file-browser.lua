return {
  after = "telescope.nvim",
  config = function() require("telescope").load_extension "file_browser" end,
}
