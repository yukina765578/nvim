# LSP and Formatting Configuration

## Installed LSP Servers (via Mason)
- **html** - HTML language server
- **cssls** - CSS language server
- **tailwindcss** - Tailwind CSS IntelliSense
- **svelte** - Svelte language server
- **lua_ls** - Lua language server (with vim global configured)
- **graphql** - GraphQL language server
- **emmet_ls** - Emmet abbreviations
- **prismals** - Prisma schema language server
- **pyright** - Python language server (static type checker)
- **omnisharp** - C# language server (for Unity)
- **ruff** - Python linter

## Installed Tools (via Mason)
- **prettier** - Multi-language formatter (JS/TS/CSS/HTML/JSON/YAML/Markdown)
- **eslint_d** - JavaScript/TypeScript linter
- **stylua** - Lua formatter
- **black** - Python formatter
- **mypy** - Python static type checker
- **debugpy** - Python debugger
- **csharpier** - C# formatter (configured with custom path)

## Formatters by File Type
Configured in `lua/plugins/formatting.lua`:
- JavaScript/TypeScript/React: prettier
- CSS/HTML/JSON/YAML/Markdown: prettier
- Lua: stylua
- C#: csharpier (custom Mason binary path)
- Python: black + ruff

## Format on Save
- Enabled by default for all configured file types
- Timeout: 1000ms
- Falls back to LSP formatting if no formatter configured
- Manual format: `<leader>mp` in normal or visual mode

## LSP Keybindings
Auto-configured when LSP attaches (see `lua/plugins/lsp/lspconfig.lua`):
- `gR` - Show LSP references (Telescope)
- `gD` - Go to declaration
- `gd` - Show definitions (Telescope)
- `gi` - Show implementations (Telescope)
- `gt` - Show type definitions (Telescope)
- `<leader>ca` - Code actions
- `<leader>rn` - Rename symbol
- `<leader>D` - Buffer diagnostics (Telescope)
- `<leader>d` - Line diagnostics (floating window)
- `[d` - Previous diagnostic
- `]d` - Next diagnostic
- `K` - Hover documentation
- `<leader>rs` - Restart LSP

## Special LSP Configurations

### Svelte
- Auto-notifies of changes in JS/TS files
- Integrated with TypeScript/JavaScript files

### GraphQL
- Configured for .graphql, .gql files
- Also works in Svelte, TypeScript React, JavaScript React

### Emmet
- Works in HTML, CSS variants, and framework files
- TypeScript React, JavaScript React, Svelte support

### Lua Language Server
- Recognizes 'vim' as global
- Call snippet completion style: Replace
