function AttachDebugLocalhost()
  local dap = require "dap"
  dap.configurations.java = {
    {
      type = "java",
      request = "attach",
      name = "Attach to the process",
      hostName = "localhost",
      port = "5005",
    },
  }
  dap.continue()
end

return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    init = function()
      astronvim.lsp.skip_setup = require("astronvim.utils").list_insert_unique(astronvim.lsp.skip_setup, "jdtls")
    end,
    ---@diagnostic disable-next-line: unused-local
    opts = function(_, opts)
      -- determine config for current OS
      local home = os.getenv "HOME"
      if vim.fn.has "mac" == 1 then
        WORKSPACE_PATH = home .. "/jdtls_workspace/"
        OS = "mac"
      elseif vim.fn.has "unix" == 1 then
        WORKSPACE_PATH = home .. "/jdtls_workspace/"
        OS = "linux"
      else
        vim.notify "Unsupported system"
        return
      end

      -- calculate root directory
      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
      local root_dir = require("jdtls.setup").find_root(root_markers)

      -- calculate workspace dir
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = WORKSPACE_PATH .. project_name

      -- get the mason install path
      local jdtls_install_path = require("mason-registry").get_package("jdtls"):get_install_path()
      local java_test_path = require("mason-registry").get_package("java-test"):get_install_path()
      local java_debug_adapter_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()

      local bundles = {}

      -- add java test & debugger into the bundles
      vim.list_extend(bundles, vim.split(vim.fn.glob(java_test_path .. "/extension/server/*.jar"), "\n"))

      vim.list_extend(
        bundles,
        vim.split(
          vim.fn.glob(java_debug_adapter_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"),
          "\n"
        )
      )

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      }

      local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
      extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

      return {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-javaagent:" .. jdtls_install_path .. "/lombok.jar",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          vim.fn.glob(jdtls_install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
          "-configuration",
          jdtls_install_path .. "/config_" .. OS,
          "-data",
          workspace_dir,
        },
        root_dir = root_dir,
        settings = {
          java = {
            eclipse = {
              downloadSources = true,
            },
            configuration = {
              updateBuildConfiguration = "interactive",
              runtimes = {
                -- loop folder in sdkman candidates java folder and automatically add it to runtime table
                {
                  name = "JavaSE-17",
                  path = home .. "/.sdkman/candidates/java/17.0.9-tem",
                },
                {
                  name = "JavaSE-21",
                  path = home .. "/.sdkman/candidates/java/21.0.1-tem",
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
                url = "/Users/jrakhman/.config/nvim/lua/user/formatter_styles/eclipse-java-custom-style.xml",
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
          extendedClientCapabilities = extendedClientCapabilities,
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
        flags = {
          allow_incremental_sync = true,
        },
        init_options = {
          bundles = bundles,
        },
        handlers = {},
        filetypes = { "java" },
        on_attach = function(client, bufnr)
          require("jdtls").setup_dap()
          require("astronvim.utils.lsp").on_attach(client, bufnr)
        end,
      }
    end,
    config = function(_, opts)
      -- setup autocmd on java filetype
      vim.api.nvim_create_autocmd("Filetype", {
        pattern = "java",
        callback = function()
          if opts.root_dir and opts.root_dir ~= "" then
            -- attach jdtls
            require("jdtls").start_or_attach(opts)

            -- add commands to set runtime and update jdtls config
            vim.cmd [[command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)]]
            vim.cmd [[command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()]]

            --TODO: move this to keymap folder
            ---------------------------------------------------------------------------------------------------------------------
            -- Keymap for Java --
            ---------------------------------------------------------------------------------------------------------------------

            local status_ok, which_key = pcall(require, "which-key")
            if not status_ok then return end

            local mappings = {
              c = {
                name = "Code",
                o = { "<Cmd>lua require'jdtls'.organize_imports()<CR>", "Organize Imports" },
                v = { "<Cmd>lua require('jdtls').extract_variable()<CR>", "Extract Variable" },
                c = { "<Cmd>lua require('jdtls').extract_constant()<CR>", "Extract Constant" },
                t = { "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", "Test Method" },
                T = { "<Cmd>lua require'jdtls'.test_class()<CR>", "Test Class" },
                u = { "<Cmd>JdtUpdateConfig<CR>", "Update Config" },
                a = { "<Cmd>lua AttachDebugLocalhost()<CR>", "Attach Debugger" },
              },
            }

            local vmappings = {
              c = {
                name = "Code",
                v = { "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", "Extract Variable" },
                c = { "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", "Extract Constant" },
                m = { "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", "Extract Method" },
              },
            }

            which_key.register(mappings, {
              mode = "n", -- NORMAL mode
              prefix = "<leader>",
              buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
              silent = true, -- use `silent` when creating keymaps
              noremap = true, -- use `noremap` when creating keymaps
              nowait = true, -- use `nowait` when creating keymaps
            })

            which_key.register(vmappings, {
              mode = "v", -- VISUAL mode
              prefix = "<leader>",
              buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
              silent = true, -- use `silent` when creating keymaps
              noremap = true, -- use `noremap` when creating keymaps
              nowait = true, -- use `nowait` when creating keymaps
            })
          else
            require("astronvim.utils").notify(
              "jdtls: root_dir not found. Please specify a root marker",
              vim.log.levels.ERROR
            )
          end
        end,
      })
      -- create autocmd to load main class configs on LspAttach.
      -- This ensures that the LSP is fully attached.
      -- See https://github.com/mfussenegger/nvim-jdtls#nvim-dap-configuration
      vim.api.nvim_create_autocmd("LspAttach", {
        pattern = "*.java",
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          -- ensure that only the jdtls client is activated
          if client.name == "jdtls" then
            require("jdtls.dap").setup_dap_main_class_configs()
            require("jdtls").setup_dap { hotcodereplace = "auto" }
          end
        end,
      })
    end,
  },
}
