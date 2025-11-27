return {
  "obsidian-nvim/obsidian.nvim",
  event = { "BufReadPre  */obsidian_vault/*/*.md" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "hrsh7th/nvim-cmp", optional = true },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["gf"] = {
              function()
                if require("obsidian").util.cursor_on_markdown_link() then
                  return "<Cmd>FollowLink<CR>"
                else
                  return "gf"
                end
              end,
              desc = "Obsidian Follow Link",
            },
          },
        },
      },
    },
  },
  opts = function(_, opts)
    local astrocore = require "astrocore"
    return astrocore.extend_tbl(opts, {
      legacy_commands = false,
      open = {
        use_advanced_uri = true,
      },
      finder = (astrocore.is_available "telescope.nvim" and "telescope.nvim"),

      workspaces = {
        {
          name = "personal",
          path = vim.env.HOME .. "/projects/obsidian_vault/personal",
        },
      },

      templates = {
        folder = "template",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {
          today = function() return os.date("%Y-%m-%d", os.time()) end,
          yesterday = function() return os.date("%Y-%m-%d", os.time() - 86400) end,
          tomorrow = function() return os.date("%Y-%m-%d", os.time() + 86400) end,
        },
      },

      -- notes_subdir = "notes",

      completion = {
        nvim_cmp = true,
        blink = false,
      },

      daily_notes = {
        folder = "dailies",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        -- Optional, default tags to add to each new daily note created.
        default_tags = { "daily-notes" },
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = "daily",
        -- Optional, if you want `Obsidian yesterday` to return the last work day or `Obsidian tomorrow` to return the next work day.
        workdays_only = true,
      },

      note_frontmatter_func = function(note)
        -- This is equivalent to the default frontmatter function.
        local out = { id = note.id, aliases = note.aliases, tags = note.tags }
        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end
        return out
      end,

      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      follow_url_func = vim.ui.open,
      attachments = {
        img_folder = "./assets",
      },
    })
  end,
}
