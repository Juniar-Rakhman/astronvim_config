return {
  after = "telescope.nvim",
  config = function() require("telescope").load_extension "project" end,
}
