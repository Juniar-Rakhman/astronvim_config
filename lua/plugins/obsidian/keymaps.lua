-- called in polish.lua

---------------------------------------------------------------------------------------------------------------------
-- Keymap for Obsidian --
---------------------------------------------------------------------------------------------------------------------
local which_key_ok, wk = pcall(require, "which-key")
if not which_key_ok then return end

local mappings = {
  { "<Leader>c", group = "Code (Obsidian)" },
  {
    mode = { "n" },
    noremap = true,
    { "gd", "<Cmd>ObsidianFollowLink<cr>", desc = "Go to link", remap = true },
    { "gb", "<Cmd>ObsidianBacklinks<cr>", desc = "Go to backlinks", remap = true },
    { "<Leader>co", "<Cmd>Obsidian<cr>", desc = "Commands" },
    { "<Leader>cb", "<Cmd>ObsidianBacklinks<cr>", desc = "Go to Backlinks" },
    { "<Leader>ch", "<Cmd>ObsidianToggleCheckbox<cr>", desc = "Checkbox" },
    { "<Leader>ct", "<Cmd>ObsidianTags<cr>", desc = "Search by Tags" },
    { "<Leader>cf", "<Cmd>ObsidianFollowLink vsplit<cr>", desc = "Follow Link (vsplit)" },
    { "<Leader>cF", "<Cmd>ObsidianFollowLink hsplit<cr>", desc = "Follow Link (hsplit)" },
    { "<Leader>cs", "<Cmd>ObsidianQuickSwitch<cr>", desc = "Search Notes" },
    { "<Leader>cd", "<Cmd>ObsidianDailies<cr>", desc = "Open Daily Notes" },
    { "<Leader>cl", "<Cmd>ObsidianLinkNew<cr>", desc = "New link" },
    { "<Leader>cp", "<Cmd>ObsidianPasteImg<cr>", desc = "Paste Image" },
  },
  {
    mode = { "v" },
    { "<Leader>co", "<Cmd>Obsidian<cr>", desc = "Commands" },
    { "<Leader>cl", "<Cmd>ObsidianLinkNew<cr>", desc = "New link from selection" },
  },
}

wk.add(mappings)
