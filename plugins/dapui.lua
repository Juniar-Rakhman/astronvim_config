return {
  expand_lines = true,
  icons = { expanded = "", collapsed = "▶", current_frame = "▶" },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.33,
      position = "right",
    },
    {
      elements = {
        { id = "repl", size = 0.45 },
        { id = "console", size = 0.55 },
      },
      size = 0.27,
      position = "bottom",
    },
    floating = {
      max_height = 0.9,
      max_width = 0.5, -- Floats will be treated as percentage of your screen.
      border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
      mappings = {
        close = { "q", "<Esc>" },
      },
    },
  },
  controls = {
    enabled = true,
    -- Display controls in this element
    element = "console",
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
