---------------------------------------------
-- extends astrocommunity.pack.java
---------------------------------------------

return {
  "mfussenegger/nvim-jdtls",
  opts = {
    settings = {
      java = {
        configuration = {
          runtimes = {
            {
              name = "JavaSE-17",
              path = os.getenv "HOME" .. "/.sdkman/candidates/java/17.0.9-tem",
            },
            {
              name = "JavaSE-21",
              path = os.getenv "HOME" .. "/.sdkman/candidates/java/21.0.1-tem",
            },
          },
        },
        maven = {
          downloadSources = true,
        },
        implementationsCodeLens = {
          enabled = true,
        },
        referencesCodeLens = { -- Turn this off, causes lag.
          enabled = false,
        },
        references = {
          includeDecompiledSources = false,
        },
        format = {
          settings = {
            url = os.getenv "HOME" .. "/.config/nvim/formatter/eclipse-java-indent-4-style.xml",
            profile = "GoogleStyle",
          },
        },
        compiler = {
          taskTags = "", -- disables task tag diagnostics entirely
          taskPriorities = "", -- no priorities since there are no task tags
          taskCaseSensitive = false, -- doesn't matter, but kept explicit
        },
      },
    },
    handlers = {
      -- Do not show TODO diagnostics
      ["textDocument/publishDiagnostics"] = function(err, result, ctx)
        if result and result.diagnostics then
          result.diagnostics = vim.tbl_filter(
            function(diagnostic) return not diagnostic.message:match "^TODO" end,
            result.diagnostics
          )
        end
        vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
      end,
    },
  },
}
