return {
  "Exafunction/codeium.vim",
  cmd = "Codeium",
  version = "1.8.37",
  config = function()
    vim.keymap.set("i", "<A-right>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
    vim.keymap.set("i", "<A-up>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
    vim.keymap.set("i", "<A-down>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
    vim.keymap.set("i", "<A-left>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
  end,
}
