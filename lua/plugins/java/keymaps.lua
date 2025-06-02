-- called in polish.lua

function AttachDebugger(host, port)
  local dap = require "dap"
  dap.configurations.java = {
    {
      type = "java",
      request = "attach",
      name = "Attach debugger",
      hostName = host,
      port = port,
    },
  }
  dap.continue()
end

---------------------------------------------------------------------------------------------------------------------
-- Keymap for Java --
---------------------------------------------------------------------------------------------------------------------

local which_key_ok, wk = pcall(require, "which-key")
if not which_key_ok then return end

local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then return end

local jdtls_test_ok, jdtls_test = pcall(require, "jdtls.tests")
if not jdtls_test_ok then return end

wk.add {
  { "<Leader>c", group = "Code (Java)" },
  {
    mode = { "n", "v" },
    { "<Leader>cv", function() jdtls.extract_variable() end, desc = "Extract Variable" },
    { "<Leader>co", function() jdtls.extract_constant() end, desc = "Extract Constant" },
  },
  {
    mode = { "n" },
    { "<Leader>cm", function() jdtls.organize_imports() end, desc = "Extract Method" },
    { "<Leader>ct", function() jdtls.test_nearest_method() end, desc = "Test Method" },
    { "<Leader>cT", function() jdtls.test_class() end, desc = "Test Class" },
    { "<Leader>ca", function() AttachDebugger("localhost", 5005) end, desc = "Attach Debugger - localhost" },
    { "<Leader>cg", function() jdtls_test.generate() end, desc = "Generate Test" },
    { "<Leader>cG", function() jdtls_test.goto_subjects() end, desc = "Go to Subject" },
  },
}

-- wk.register(mappings, {
--   mode = "n", -- NORMAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- })
--
-- wk.register(vmappings, {
--   mode = "v", -- VISUAL mode
--   prefix = "<leader>",
--   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--   silent = true, -- use `silent` when creating keymaps
--   noremap = true, -- use `noremap` when creating keymaps
--   nowait = true, -- use `nowait` when creating keymaps
-- })
