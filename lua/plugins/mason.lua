---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
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
        -- "marksman", -- using obsidian

        -- install formatters
        "prettier",
        "stylua",

        -- install debuggers
        -- "debugpy", -- not doing python yet

        -- install any other package
        "tree-sitter-cli",
      },
    },
  },
}
