# Code Style and Conventions

## Lua Files (Neovim Config)
- **Indentation**: 2 spaces (tabs converted to spaces)
- **Tab Settings**: 
  - `tabstop=2`
  - `softtabstop=2`
  - `shiftwidth=2`
  - `expandtab=true`
- **Encoding**: UTF-8

## C# Files (Unity Development)
- **Indentation**: 4 spaces
- **Tab Settings**:
  - `tabstop=4`
  - `softtabstop=4`
  - `shiftwidth=4`
  - `expandtab=true`
- **Comment Style**: `// %s`

## Plugin Configuration Pattern
All plugins follow this structure:
```lua
return {
  "author/plugin-name",
  event = { "BufReadPre", "BufNewFile" }, -- or other lazy-loading events
  dependencies = { ... },                 -- optional
  config = function()
    local plugin = require("plugin-name")
    plugin.setup({
      -- configuration options
    })
  end,
}
```

## File Organization
- Each plugin gets its own file in `lua/plugins/`
- LSP-related plugins in `lua/plugins/lsp/`
- Core settings separated into focused files in `lua/config/`
- Unity-specific configuration isolated in `lua/config/unity.lua`

## Naming Conventions
- Files: lowercase with hyphens (e.g., `nvim-tree.lua`, `which-key.lua`)
- Local variables: snake_case (e.g., `local mason_lspconfig`)
- Functions: snake_case (e.g., `position_with_count()`)
- Leader key mappings: descriptive strings (e.g., `<leader>mp` for format)

## Keymap Conventions
- `<leader>` prefix for custom commands (leader = space)
- `w` prefix for window management
- `t` prefix for tab management
- `u` prefix for Unity-specific commands (in C# files)
- Descriptive `desc` fields for all keybindings (used by which-key)
