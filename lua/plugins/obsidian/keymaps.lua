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
    { "gd", "<Cmd>Obsidian follow_link<cr>", desc = "Go to link", remap = true },
    { "gb", "<Cmd>Obsidian backlinks<cr>", desc = "Go to backlinks", remap = true },
    { "<Leader>co", "<Cmd>Obsidian<cr>", desc = "Commands" },
    { "<Leader>ch", "<Cmd>Obsidian toggle_checkbox<cr>", desc = "Toggle Checkbox" },
    { "<Leader>cf", "<Cmd>Obsidian follow_link vsplit<cr>", desc = "Follow Link (vsplit)" },
    { "<Leader>cF", "<Cmd>Obsidian follow_link hsplit<cr>", desc = "Follow Link (hsplit)" },
    { "<Leader>cs", "<Cmd>Obsidian quick_switch<cr>", desc = "Find Notes" },
    { "<Leader>cd", "<Cmd>Obsidian dailies<cr>", desc = "Open Daily Notes" },
    { "<Leader>cl", "<Cmd>Obsidian link_new<cr>", desc = "New link" },
    { "<Leader>cp", "<Cmd>Obsidian paste_image<cr>", desc = "Paste Image" },
  },
  {
    mode = { "v" },
    { "<Leader>co", "<Cmd>Obsidian<cr>", desc = "Commands" },
    { "<Leader>cl", "<Cmd>Obsidian link_new<cr>", desc = "New link from selection" },
  },
}

wk.add(mappings)
