# Suggested Commands

## System Commands (WSL/Ubuntu on Windows)
Since this is running on WSL2 Ubuntu on Windows, use standard Linux commands:

### File Operations
- `ls -la` - List files with details
- `cd <path>` - Change directory
- `pwd` - Print working directory
- `find . -name "*.lua"` - Find files by pattern
- `grep -r "pattern" .` - Search for text in files

### Git Commands
- `git status` - Check repository status
- `git add .` - Stage all changes
- `git commit -m "message"` - Commit changes
- `git push` - Push to remote
- `git pull` - Pull from remote
- `git diff` - View changes

## Neovim Development Commands

### Plugin Management
- `:Lazy` - Open Lazy.nvim UI
- `:Lazy sync` - Update all plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy check` - Check for plugin updates

### LSP and Tools Management
- `:Mason` - Open Mason UI for LSP/tools
- `:MasonUpdate` - Update Mason packages
- `:MasonInstall <package>` - Install a package
- `:LspInfo` - Show LSP server status
- `:LspRestart` - Restart LSP servers

### Formatting and Linting
Formatting happens automatically on save via conform.nvim, or manually:
- `<leader>mp` (in normal or visual mode) - Format file or selection
- `:ConformInfo` - Show formatter status

### Treesitter
- `:TSUpdate` - Update treesitter parsers
- `:TSInstall <language>` - Install language parser

### Testing Configuration
To test if config loads properly:
- `nvim --headless +checkhealth +qa` - Run health checks
- `:checkhealth` - Check configuration health (inside nvim)
- `:checkhealth lazy` - Check lazy.nvim
- `:checkhealth mason` - Check Mason setup
- `:checkhealth lsp` - Check LSP configuration

### Reloading Configuration
After making changes:
- `:source $MYVIMRC` - Reload init.lua
- `:Lazy reload <plugin>` - Reload specific plugin
- Or restart Neovim

## Unity-Specific (in C# files)
- `<leader>ud` - Open Unity documentation for word under cursor
- `<leader>uc` - Create MonoBehaviour class template

## Key Editor Keybindings
See lua/config/keymaps.lua for full list:
- `<C-p>` - Enter command mode (like `:`)
- `<leader>nh` - Clear search highlights
- `<leader>wv` - Split window vertically
- `<leader>wh` - Split window horizontally
- `<leader>to` - Open new tab
- `<C-a>` - Select all
- `<C-c>` (visual mode) - Copy to system clipboard
