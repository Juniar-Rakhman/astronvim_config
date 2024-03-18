---@type LazySpec
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    -- third status line
    opts.statusline[3] = status.component.file_info { filetype = false, filename = { modify = ":." } }
    -- breadcrumbs
    opts.winbar[2] = {
      status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
      status.component.file_info {
        file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
        hl = status.hl.get_attributes("winbar", true),
        update = "BufEnter",
      },
      status.component.breadcrumbs {
        icon = { hl = true },
        hl = status.hl.get_attributes("winbar", true),
        prefix = true,
        padding = { left = 0 },
      },
    }
    return opts
  end,
}
