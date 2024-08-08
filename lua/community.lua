---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" }, --TODO: replace with built in nvim lsp signature helper
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.pack.java" },
}
