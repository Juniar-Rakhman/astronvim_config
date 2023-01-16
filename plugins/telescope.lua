return {
  defaults = {
    layout_strategy = "vertical",
    prompt_prefix = string.format("%s ", astronvim.get_icon "Search"),
    selection_caret = string.format("%s ", astronvim.get_icon "Selected"),
    path_display = { "truncate" },
    sorting_strategy = "ascending",
    layout_config = {
      vertical = {
        prompt_position = "top",
        mirror = true,
        results_height = 0.6,
        preview_height = 0.7,
      },
      height = 0.87,
      preview_cutoff = 25,
    },
  },
}
