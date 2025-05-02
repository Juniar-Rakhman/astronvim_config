return {
  { --- disable all <Leader>b keymaps
    "AstroNvim/astrocore",
    ---@param opts AstroCoreOpts
    opts = function(_, opts)
      if vim.tbl_get(opts, "options", "opt", "showtabline") then opts.options.opt.showtabline = nil end
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
          filename = { modify = ":t" },
          filetype = false,
          file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
          file_modified = false,
          file_read_only = false,
          hl = status.hl.get_attributes("winbar", true),
          update = "BufEnter",
        },
        status.component.breadcrumbs {
          icon = { hl = true },
          hl = status.hl.get_attributes("winbar", true),
          prefix = false,
          padding = { left = 0 },
        },
      }
      return opts
    end,
  },
}
