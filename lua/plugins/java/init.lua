---------------------------------------------
-- extends astrocommunity.pack.java
---------------------------------------------

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
        format = {
          settings = {
            url = os.getenv "HOME" .. "/.config/nvim/formatter/eclipse-java-custom-style.xml",
            profile = "GoogleStyle",
          },
        },
      },
    },
  },
}
