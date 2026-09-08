local M = {}

local FORMATTERS = {
  almende = {
    url = os.getenv "HOME" .. "/.config/nvim/formatter/almende-java.xml",
    profile = "Almende",
  },
  savapage = {
    url = os.getenv "HOME" .. "/.config/nvim/formatter/savapage-java.xml",
    profile = "SavaPage",
  },
}

M.current = "almende"

function M.get_settings()
  local f = FORMATTERS[M.current]
  return { url = f.url, profile = f.profile }
end

function M.get(name) return FORMATTERS[name] end

function M.set(name)
  if not FORMATTERS[name] then
    vim.notify("Unknown formatter: " .. tostring(name), vim.log.levels.WARN)
    return false
  end
  M.current = name
  vim.notify("Java formatter set to: " .. name)
  return true
end

function M.toggle()
  local next = M.current == "almende" and "savapage" or "almende"
  M.set(next)
end

function M.restart_jdtls()
  local clients = vim.lsp.get_clients { name = "jdtls" }
  if #clients == 0 then
    vim.notify("No active jdtls client; will apply on next attach. Formatter: " .. M.current)
    return
  end
  -- push current settings to the live jdtls client
  for _, client in ipairs(clients) do
    local settings = vim.deepcopy(client.config.settings or {})
    settings.java = settings.java or {}
    settings.java.format = settings.java.format or {}

    ---@diagnostic disable-next-line: inject-field
    settings.java.format.settings = M.get_settings()

    ---@diagnostic disable-next-line: param-type-mismatch
    client.notify("workspace/didChangeConfiguration", {
      settings = settings,
    })
    vim.notify("jdtls formatter switched to: " .. M.current)
  end
end

function M.switch(name)
  if name and M.set(name) then
    M.restart_jdtls()
    return true
  end
  M.toggle()
  M.restart_jdtls()
  return true
end

function M.switch_prompt()
  local choices = vim.tbl_keys(FORMATTERS)
  table.sort(choices)
  vim.ui.select(choices, {
    prompt = "Select Java formatter:",
    format_item = function(item)
      local marker = item == M.current and " *" or ""
      return item .. marker
    end,
  }, function(choice)
    if not choice then return end
    if not FORMATTERS[choice] then
      vim.notify("Unknown formatter: " .. choice .. ". Pick from " .. table.concat(choices, ", "), vim.log.levels.WARN)
      return M.switch_prompt()
    end
    M.set(choice)
    M.restart_jdtls()
  end)
end

return M
