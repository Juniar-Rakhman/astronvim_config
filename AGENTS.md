# AstroNvim Configuration Agent Guidelines

## Build/Lint/Test Commands

- **Format**: `stylua .` (formats all Lua files)
- **Lint**: `selene .` (Lua linting with neovim std)
- **Type check**: Lua LS provides diagnostics via `:LspInfo`
- **Test**: No formal test suite - validate by restarting Neovim (`nvim --headless +qa`)

## Code Style Guidelines

- **Indentation**: 2 spaces (configured in .stylua.toml)
- **Line width**: 120 characters max
- **Quotes**: Prefer double quotes, auto-convert when appropriate
- **Type annotations**: Use `---@type` comments for function returns and tables
- **File structure**: Plugin configs in `lua/plugins/` with descriptive names
- **Naming**: snake_case for variables/functions, PascalCase for modules
- **Error handling**: Use `pcall()` for safe operations, vim.notify() for user feedback
- **Imports**: Use `require()` with relative paths for local modules
- **Tables**: Use mixed table syntax (brackets for arrays, braces for dicts)
- **Functions**: Prefer local functions, export tables with `return { ... }`
- **Comments**: Use `--` for single line, `--[[ ]]` for block comments
- **LSP**: Configure language servers in `astrolsp.lua`, disable lua_ls formatting (use StyLua)
