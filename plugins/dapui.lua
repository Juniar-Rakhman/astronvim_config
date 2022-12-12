return {
  icons = { expanded = "", collapsed = "▶", current_frame = "▶" },
  layouts = {
    {
      elements = {
        -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.3 },
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "console",
        "repl",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "⏸️",
      play = "▶️",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "◀",
      run_last = "",
      terminate = "",
    },
  },
}
