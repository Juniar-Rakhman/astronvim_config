-- extends  astrocommunity.pack.java

function AttachDebugger(host, port)
  local dap = require "dap"
  dap.configurations.java = {
    {
      type = "java",
      request = "attach",
      name = "Attach debugger",
      hostName = host,
      port = port,
    },
  }
  dap.continue()
end

return {
  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          configuration = {
            updateBuildConfiguration = "interactive",
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
          referencesCodeLens = {
            enabled = false,
          },
          references = {
            includeDecompiledSources = false,
          },
          inlayHints = {
            parameterNames = {
              enabled = "all", -- literals, all, none
            },
          },
          format = {
            enabled = true,
            settings = {
              url = os.getenv "HOME" .. ".config/nvim/lua/user/formatter_styles/eclipse-java-custom-style.xml",
              profile = "GoogleStyle",
            },
          },
        },

        signatureHelp = { enabled = true },
        completion = {
          favoriteStaticMembers = {
            "org.hamcrest.MatcherAssert.assertThat",
            "org.hamcrest.Matchers.*",
            "org.hamcrest.CoreMatchers.*",
            "org.junit.jupiter.api.Assertions.*",
            "java.util.Objects.requireNonNull",
            "java.util.Objects.requireNonNullElse",
            "org.mockito.Mockito.*",
          },
        },
        contentProvider = { preferred = "fernflower" },
        sources = {
          organizeImports = {
            starThreshold = 9999,
            staticStarThreshold = 9999,
          },
        },
        codeGeneration = {
          toString = {
            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
          },
          useBlocks = true,
        },
      },
      handlers = {},
    },
  },
}
