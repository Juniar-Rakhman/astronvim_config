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
    ft = { "java" },
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      {
        "AstroNvim/astrolsp",
        optional = true,
        ---@type AstroLSPOpts
        opts = {
          ---@diagnostic disable: missing-fields
          handlers = { jdtls = false },
        },
      },
    },
    opts = function(_, opts)
      local utils = require "astrocore"
      -- use this function notation to build some variables
      local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", ".project" }
      local root_dir = require("jdtls.setup").find_root(root_markers)
      -- calculate workspace dir
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = vim.fn.stdpath "data" .. "/site/java/workspace-root/" .. project_name
      vim.fn.mkdir(workspace_dir, "p")

      -- validate operating system
      if not (vim.fn.has "mac" == 1 or vim.fn.has "unix" == 1 or vim.fn.has "win32" == 1) then
        utils.notify("jdtls: Could not detect valid OS", vim.log.levels.ERROR)
      end

      return utils.extend_tbl({
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-javaagent:" .. vim.fn.expand "$MASON/share/jdtls/lombok.jar",
          "-Xms1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens",
          "java.base/java.util=ALL-UNNAMED",
          "--add-opens",
          "java.base/java.lang=ALL-UNNAMED",
          "-jar",
          vim.fn.expand "$MASON/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
          "-configuration",
          vim.fn.expand "$MASON/share/jdtls/config",
          "-data",
          workspace_dir,
        },
        root_dir = root_dir,
        settings = {
          java = {
            eclipse = { downloadSources = true },
            configuration = {
              updateBuildConfiguration = "interactive",
              runtimes = {
                {
                  name = "JavaSE-17",
                  path = "/Users/jrakhman/.sdkman/candidates/java/17.0.9-tem",
                },
                {
                  name = "JavaSE-21",
                  path = "/Users/jrakhman/.sdkman/candidates/java/21.0.1-tem",
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
                url = "/Users/jrakhman/.config/nvim/formatter/eclipse-java-custom-style.xml",
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
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
        },
        init_options = {
          bundles = {
            vim.fn.expand "$MASON/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar",
            -- unpack remaining bundles
            (table.unpack or unpack)(vim.split(vim.fn.glob "$MASON/share/java-test/*.jar", "\n", {})),
          },
        },
        handlers = {
          ["$/progress"] = function() end, -- disable progress updates.
        },
        filetypes = { "java" },
        on_attach = function(...)
          require("jdtls").setup_dap { hotcodereplace = "auto" }
          local astrolsp_avail, astrolsp = pcall(require, "astrolsp")
          if astrolsp_avail then astrolsp.on_attach(...) end
        end,
      }, opts)
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
              mode = "n",     -- NORMAL mode
              prefix = "<leader>",
              buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
              silent = true,  -- use `silent` when creating keymaps
              noremap = true, -- use `noremap` when creating keymaps
              nowait = true,  -- use `nowait` when creating keymaps
            })
            which_key.register(vmappings, {
              mode = "v",     -- VISUAL mode
              prefix = "<leader>",
              buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
              silent = true,  -- use `silent` when creating keymaps
              noremap = true, -- use `noremap` when creating keymaps
              nowait = true,  -- use `nowait` when creating keymaps
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
        pattern = "java",
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
