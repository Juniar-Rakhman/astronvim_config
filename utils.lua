M = {}

function M.quick_notification(msg) vim.notify(msg, "info", { title = "AstroNvim", timeout = 0 }) end

function M.vim_opt_toggle(opt, on, off, name)
  local is_off = vim.opt[opt]:get() == off
  vim.opt[opt] = is_off and on or off
  M.quick_notification(name .. " " .. (is_off and "Enabled" or "Disabled"))
end

function M.async_run(cmd, on_finish)
  local lines = { "" }

  local function on_event(_, data, event)
    if (event == "stdout" or event == "stderr") and data then vim.list_extend(lines, data) end

    if event == "exit" then
      vim.fn.setqflist({}, " ", {
        title = table.concat(cmd, " "),
        lines = lines,
        efm = "%f:%l:%c: %t%n %m",
      })
      if on_finish then on_finish() end
    end
  end

  vim.fn.jobstart(cmd, {
    on_stdout = on_event,
    on_stderr = on_event,
    on_exit = on_event,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

function M.toggle_qf()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
      break
    end
  end
  if qf_exists then
    vim.cmd "cclose"
  elseif not vim.tbl_isempty(vim.fn.getqflist()) then
    vim.cmd "copen"
  end
end

function M.disable_presence() require("presence"):cancel() end

function M.enable_presence()
  require("presence"):setup {
    client_id = "1009122352916857003",
    buttons = {
      { label = "Project Repository", url = "https://github.com/AstroNvim/AstroNvim" },
      --{ label = "User Configuration", url = "https://code.mehalter.com/projects/68" },
    },
  }
end

function M.toggle_presence()
  local is_conn = require("presence").is_connected
  M[is_conn and "disable_presence" or "enable_presence"]()
  M.quick_notification("Presence " .. (is_conn and "Disabled" or "Enabled"))
end

return M
