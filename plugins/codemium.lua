return {
  "Exafunction/codeium.vim",
  cmd = "Codeium",
  -- init = function()
  --   vim.g.codeium_enabled = 1
  --   vim.g.codeium_disable_bindings = 1
  --   vim.g.codeium_idle_delay = 1500
  -- end,
  config = function()
    vim.keymap.set("i", "<A-;>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
    vim.keymap.set("i", "<A-->", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
    vim.keymap.set("i", "<A-=>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
    vim.keymap.set("i", "<A-BS>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
  end,
}
