-- called in polish.lua

---------------------------------------------------------------------------------------------------------------------
-- Keymap for Go --
---------------------------------------------------------------------------------------------------------------------

local which_key_ok, wk = pcall(require, "which-key")
if not which_key_ok then return end

local gopher_ok, gopher = pcall(require, "gopher")
if not gopher_ok then return end

local dapgo_ok, dapgo = pcall(require, "dap-go")
if not dapgo_ok then return end

wk.add {
  { "<Leader>c", group = "Code (Go)" },
  {
    mode = { "n", "v" },
    { "<Leader>cd", function() dapgo.debug_test() end, desc = "Debug Test at Cursor" },
    { "<Leader>cD", function() dapgo.debug_last_test() end, desc = "Debug Last Test" },
    { "<Leader>ct", function() gopher.test.add() end, desc = "Generate Test at Cursor" },
    { "<Leader>cT", function() gopher.test.all() end, desc = "Generate All Tests" },
    { "<Leader>ce", function() gopher.test.exported() end, desc = "Generate Exported Tests" },
    { "<Leader>ci", function() gopher.impl() end, desc = "Implement Interface" },
    { "<Leader>cx", function() gopher.iferr() end, desc = "Insert if err != nil" },
    { "<Leader>ca", function() gopher.tags.add() end, desc = "Add Struct Tags" },
    { "<Leader>cr", function() gopher.tags.rm() end, desc = "Remove Struct Tags" },
    { "<Leader>cg", function() gopher.generate() end, desc = "go generate" },
    { "<Leader>cc", function() gopher.comment() end, desc = "Add Doc Comment" },
  },
}

