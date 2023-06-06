return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-hop.nvim",
    "ahmedkhalf/project.nvim", -- defined in  ./editor.lua
  },
  opts = function(_, opts)
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local hop = telescope.extensions.hop
    local get_icon = require("astronvim.utils").get_icon
    return require("astronvim.utils").extend_tbl(opts, {
      defaults = {
        layout_strategy = "vertical",
        prompt_prefix = string.format("%s ", get_icon "Search"),
        selection_caret = string.format("%s ", get_icon "Selected"),
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
        mappings = {
          i = {
            ["<C-h>"] = hop.hop,
            ["<C-space>"] = function(prompt_bufnr)
              hop._hop_loop(
                prompt_bufnr,
                { callback = actions.toggle_selection, loop_callback = actions.send_selected_to_qflist }
              )
            end,
          },
        },
      },
      pickers = {
        lsp_references = {
          path_display = { "smart" },
        },
        find_files = {
          hidden = true,
          path_display = { "smart" },
        },
        buffers = {
          path_display = { "smart" },
          mappings = {
            i = { ["<c-d>"] = actions.delete_buffer },
            n = { ["d"] = actions.delete_buffer },
          },
        },
      },
    })
  end,
  config = function(...)
    require "plugins.configs.telescope"(...)
    local telescope = require "telescope"
    telescope.load_extension "projects"
  end,
}
