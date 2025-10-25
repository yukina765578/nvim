# Project Overview

## Purpose
This is a personal Neovim configuration repository designed for multi-language development with a focus on:
- Web development (JavaScript/TypeScript, CSS, HTML, Svelte)
- Unity game development (C#)
- Python development
- Lua scripting

The configuration uses modern Neovim features and is optimized for LSP-based development with code completion, formatting, and diagnostics.

## Tech Stack
- **Editor**: Neovim (configured in Lua)
- **Plugin Manager**: lazy.nvim
- **LSP Manager**: Mason + mason-lspconfig
- **Completion**: nvim-cmp with multiple sources
- **Formatter**: conform.nvim
- **Syntax Highlighting**: nvim-treesitter
- **File Explorer**: nvim-tree
- **Fuzzy Finder**: telescope.nvim
- **Git Integration**: lazygit.nvim
- **AI Assistants**: copilot.lua, claudecode.nvim

## Project Structure
```
.
├── init.lua                 # Entry point, loads config module
├── lua/
│   ├── config/             # Core configuration
│   │   ├── init.lua        # Loads all config modules
│   │   ├── options.lua     # Vim options (indentation, encoding, etc.)
│   │   ├── keymaps.lua     # Custom keybindings
│   │   ├── lazy.lua        # Lazy.nvim bootstrap and setup
│   │   └── unity.lua       # Unity/C# specific configuration
│   └── plugins/            # Plugin configurations
│       ├── *.lua           # Individual plugin configs
│       └── lsp/            # LSP-specific configurations
│           ├── mason.lua   # LSP/tool installer
│           └── lspconfig.lua # LSP server configurations
├── lazy-lock.json          # Locked plugin versions
└── .luarc.json            # Lua language server config
```

## Key Features
- **Custom Keybindings**: j/k swapped, space as leader key
- **Format on Save**: Automatic formatting using conform.nvim
- **Unity Support**: C#-specific settings, Unity docs integration
- **Multiple AI Assistants**: GitHub Copilot, Avante, Claude Code
- **Modern UI**: Custom statusline, bufferline, file tree, notifications
