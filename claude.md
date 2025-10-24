# Project Memory

This file contains version-controlled project knowledge shared across the team.

## Architecture

- Neovim configuration using Lua
- Plugin management via lazy.nvim
- Modular structure with separate config and plugin directories

## Conventions

- Indentation: 2 spaces (expandtab)
- File encoding: UTF-8
- Line numbers: relative numbering enabled
- Configuration split into logical modules in `lua/config/` and `lua/plugins/`

## Important Patterns

- Each plugin has its own dedicated Lua file in `lua/plugins/`
- Plugin files follow the lazy.nvim spec format
- LSP configurations are grouped in `lua/plugins/lsp/` subdirectory

## Project Structure

```
.config/nvim/
├── lua/
│   ├── config/          # Core Neovim settings
│   │   ├── init.lua
│   │   ├── options.lua  # General options (tabs, encoding, etc.)
│   │   ├── keymaps.lua  # Key bindings
│   │   ├── lazy.lua     # Lazy.nvim setup
│   │   └── unity.lua
│   └── plugins/         # Plugin configurations
│       ├── lsp/         # LSP-related plugins
│       └── *.lua        # Individual plugin configs
└── lazy-lock.json       # Locked plugin versions
```

### Core Dependencies

- **lazy.nvim**: Plugin manager
- **plenary.nvim**: Lua utility library (common dependency)

### Key Plugins

- **Copilot**: AI code completion
- **Telescope**: Fuzzy finder
- **treesitter**: Syntax parsing and highlighting
- **nvim-cmp**: Completion engine
- **nvim-tree**: File explorer
- **todo-comments**: Highlight TODO/FIXME comments
- **lazygit**: Git integration
- **which-key**: Keybinding helper
- **trouble**: Diagnostics list
- **claudecode.nvim**: Claude Code AI assistant integration

### Display & UI

- **lualine**: Statusline
- **bufferline**: Buffer/tab line
- **noice**: Enhanced UI messages
- **alpha**: Start screen
- **mini-icons**: Icon support
- **indent-blankline**: Indentation guides

## Notes

### Diff View Configuration

- `foldenable = false` is set in `lua/config/options.lua` to show full file content in diff views
- This ensures that when reviewing code changes (e.g., from Claude Code), the entire file context is visible rather than just the changed sections
- This setting applies to all Neovim diff modes (vimdiff, git diff views, etc.)

### Claude Code Integration

- Claude Code plugin (`lua/plugins/claudecode.lua`) provides AI-assisted editing with diff views
- Key features configured:
  - Window reuse for diff views (`reuse_win = true`)
  - Line wrapping enabled in diff buffers for better readability
  - Custom keybindings under `<leader>a` prefix
- **Buffer synchronization**: `autoread` is enabled in `lua/config/options.lua` to automatically reload files when Claude Code (or other external tools) modify them
- Autocmds check for external changes on focus, buffer enter, and cursor idle events
- Window management: Claude Code handles its own window lifecycle; avoid custom autocmds that close non-diff windows

### Git Integration

- Using lazygit plugin for Git operations
- Current branch: main
- Repository is actively maintained with recent commits for Python LSP and nvim-ufo integration
