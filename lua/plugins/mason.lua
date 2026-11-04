-- Customize Mason

---@type LazySpec
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.registries = {
        "file:/Users/jrakhman/projects/lua/mason-registry",
      }
    end,
  }, -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "yaml-language-server",
        "bash-language-server",
        "json-lsp",

        -- install formatters
        "prettier",
        "stylua",

        -- install debuggers
        -- "debugpy",

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
