---------------------------------------------
-- extends astrocommunity.pack.java
---------------------------------------------

return {
  "mfussenegger/nvim-jdtls",
  opts = function(_, opts)
    -- merge user settings into existing opts
    opts.root_dir = vim.fs.root(0, { "pom.xml", "build.gradle", "settings.gradle" })
    opts.settings = vim.tbl_deep_extend("force", opts.settings or {}, {
      java = {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-21",
              path = os.getenv "HOME" .. "/.sdkman/candidates/java/21.0.1-tem",
            },
            {
              name = "JavaSE-17",
              path = os.getenv "HOME" .. "/.sdkman/candidates/java/17.0.9-tem",
            },
            {
              name = "JavaSE-11",
              path = os.getenv "HOME" .. "/.sdkman/candidates/java/11.0.27-tem",
            },
          },
        },
        maven = { downloadSources = true },
        implementationsCodeLens = { enabled = true },
        referencesCodeLens = { enabled = false }, -- Turn this off, causes lag.
        references = { includeDecompiledSources = false },
        format = {
          settings = {
            url = os.getenv "HOME" .. "/.config/nvim/formatter/savapage-java.xml",
            profile = "SavaPage",
          },
        },
        compiler = {
          taskTags = "", -- disables task tag diagnostics entirely
          taskPriorities = "", -- no priorities since there are no task tags
          taskCaseSensitive = false, -- doesn't matter, but kept explicit
        },
      },
    })

    opts.handlers = {
      -- filter out TODO from list of diagnostics
      ["textDocument/publishDiagnostics"] = function(err, result, ctx)
        if result and result.diagnostics then
          result.diagnostics = vim.tbl_filter(
            function(diagnostic) return not diagnostic.message:match "^TODO" end,
            result.diagnostics
          )
        end
        vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
      end,
    }

    return opts
  end,
}
