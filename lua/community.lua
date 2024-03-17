---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },

  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.recipes.disable-tabline" },
  { import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },

  -- languge packs
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.docker" },
}
