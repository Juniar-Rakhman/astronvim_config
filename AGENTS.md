# AstroNvim Configuration Agent Guidelines

## Build/Lint/Test Commands

- **Format**: `stylua .` (formats all Lua files)
- **Lint**: `selene .` (Lua linting with neovim std)
- **Validate**: `nvim --headless +qa` (restart Neovim to test config changes)

## Code Style Guidelines

- **Indentation**: 2 spaces, **Line width**: 120 characters, **Quotes**: auto-prefer double
- **Type annotations**: Use `---@type` comments for function returns and tables
- **File structure**: Plugin configs in `lua/plugins/` with descriptive names, return `{ "user/repo", opts = ... }`
- **Naming**: snake_case variables/functions, PascalCase modules
- **Error handling**: `pcall()` for safe operations, `vim.notify()` for user feedback
- **Imports**: `require()` with relative paths (e.g., `require "plugins.obsidian.keymaps"`)
- **LSP**: Configure language servers in `astrolsp.lua`, `lua_ls` formatting is disabled (use StyLua)

## Repository Structure

- `init.lua` — Bootstraps Lazy.nvim, then loads `lazy_setup` and `polish`
- `lua/lazy_setup.lua` — Plugin manager setup (AstroNvim + community + local plugins)
- `lua/polish.lua` — Runs last; autocommands, filetype setup, LSP keymap wiring
- `lua/community.lua` — AstroCommunity plugin imports (packs + tools + recipes)
- `lua/plugins/` — Individual plugin configs (one file per plugin or grouped by topic)
- `lua/plugins/astroui.lua`, `lua/plugins/astrocore.lua`, `lua/plugins/astrolsp.lua` — AstroNvim feature overrides

## Architecture Notes

- This is an AstroNvim v5 user config (Neovim Lua plugin configuration), not an application
- No build step — changes take effect on Neovim restart
- Plugin specs return `{ "user/repo", opts = { ... } }` or use `---@type LazySpec`
- `vim.loop` is deprecated; use `vim.uv` (already migrated in init.lua)
- `stylua: ignore` comments suppress formatting for specific lines

```sh
cd
```
