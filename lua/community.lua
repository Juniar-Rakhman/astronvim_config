---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  --  tools
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },

  -- packs
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.full-dadbod" },
  { import = "astrocommunity.pack.php" },
}
