return {
  "rcarriga/nvim-dap-ui",
  config = function(plugin, opts)
    -- run default AstroNvim nvim-dap-ui configuration function
    require "plugins.configs.nvim-dap-ui"(plugin, opts)

    -- disable dap ui autoclose
    local dap = require "dap"
    dap.listeners.before.event_terminated["dapui_config"] = nil
    dap.listeners.before.event_exited["dapui_config"] = nil
  end,
}
