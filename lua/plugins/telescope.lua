-- extends astrocommunity.fuzzy-finder.telescope-nvim

return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local actions = require "telescope.actions"
    local get_icon = require("astroui").get_icon

    local function flash(prompt_bufnr)
      require("flash").jump {
        pattern = "^",
        label = { after = { 0, 0 } },
        search = {
          mode = "search",
          exclude = {
            function(win) return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults" end,
          },
        },
        action = function(match)
          local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
          picker:set_selection(match.pos[1] - 1)
        end,
      }
    end

    return require("astrocore").extend_tbl(opts, {
      defaults = {
        file_ignore_patterns = {
          "^node_modules/",
          "^node_",
          "^.git/",
          "^target/",
          "^build/",
          "^dist/",
          "^vendor/",
          "^.m2/",
          "^import",
          "%.class$",
        },
        layout_strategy = "vertical",

        -- use astronvim icons
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
            ["<C-s>"] = flash,
            ["<CR>"] = actions.select_default + actions.center,
          },
          n = { s = flash },
        },
      },
      pickers = {
        current_buffer_fuzzy_find = {
          previewer = false,
        },
        lsp_references = {
          path_display = { "tail" },
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
}
