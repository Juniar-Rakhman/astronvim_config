return {
  {
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      for k, _ in pairs(opts.mappings.n) do
        if k:find "^<Leader>b" then opts.mappings.n[k] = false end
      end
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline[3] = status.component.file_info { filetype = false, filename = { modify = ":." } }
      opts.tabline = nil -- disable tabline
      -- breadcrumbs
      opts.winbar[2] = {
        status.component.separated_path { path_func = status.provider.filename { modify = ":.:h" } },
        status.component.file_info { -- add file_info to breadcrumbs
          file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
          filename = {},
          filetype = false,
          hl = status.hl.get_attributes("winbar", true),
          surround = false,
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
  },
}
