-- see polish.lua

---------------------------------------------------------------------------------------------------------------------
-- Keymap for Java --
---------------------------------------------------------------------------------------------------------------------

local which_key_ok, which_key = pcall(require, "which-key")
if not which_key_ok then return end

local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then return end

local mappings = {
  c = {
    name = "Code",
    o = { function() jdtls.organize_imports() end, "Organize Imports" },
    v = { function() jdtls.extract_variable() end, "Extract Variable" },
    c = { function() require("jdtls").extract_constant() end, "Extract Constant" },
    t = { function() require("jdtls").test_nearest_method() end, "Test Method" },
    T = { function() require("jdtls").test_class() end, "Test Class" },
    u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
    a = { function() AttachDebugger("localhost", 5005) end, "Attach Debugger - localhost" },
    G = { function() require("jdtls.tests").generate() end, "Generate Test" },
    g = { function() require("jdtls.tests").goto_subjects() end, "Go To Subjects" },
  },
}

local vmappings = {
  c = {
    name = "Code",
    v = { function() require("jdtls").extract_variable() end, "Extract Variable" },
    c = { function() require("jdtls").extract_constant() end, "Extract Constant" },
    m = { function() require("jdtls").extract_method() end, "Extract Method" },
  },
}

which_key.register(mappings, {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})

which_key.register(vmappings, {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
})
