---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },
  -- recipes
  { import = "astrocommunity.recipes.diagnostic-virtual-lines-current-line" },
  --  tools
  { import = "astrocommunity.fuzzy-finder.telescope-nvim" },
  { import = "astrocommunity.split-and-window.colorful-winsep-nvim" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  -- packs
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.laravel" },

  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.full-dadbod" },
}
