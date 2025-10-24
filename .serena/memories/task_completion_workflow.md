# Task Completion Workflow

## When Task is Completed

### 1. Automatic Actions
The following happen automatically when you save files:
- **Formatting**: Files are auto-formatted on save via conform.nvim
- **LSP Diagnostics**: Errors/warnings update automatically

### 2. Manual Verification Steps

#### Check for Issues
```vim
:checkhealth           " Run health checks if config was modified
:LspInfo              " Verify LSP servers are running
:ConformInfo          " Check formatter status
```

#### For Plugin Changes
If you modified plugin configurations:
```vim
:Lazy sync            " Sync plugins (update/install/clean)
:Lazy reload <plugin> " Reload specific plugin if needed
```

#### For LSP/Tool Changes
If you modified Mason configurations:
```vim
:Mason                " Open Mason UI to verify installations
:MasonUpdate          " Update tools if needed
```

### 3. Testing Changes
After making configuration changes:

#### Option 1: Reload in Current Session
```vim
:source $MYVIMRC      " Reload main config
:Lazy reload <plugin> " Reload specific plugin
```

#### Option 2: Restart Neovim
Close and reopen Neovim to ensure clean state

#### Option 3: Run Health Checks
```bash
# From terminal (headless check)
nvim --headless +checkhealth +qa

# Inside Neovim
:checkhealth
:checkhealth lazy
:checkhealth mason
:checkhealth lsp
```

### 4. Git Workflow (if applicable)
If this is a version-controlled change:
```bash
git status              # Check what changed
git add lua/plugins/... # Stage specific files
git commit -m "feat: add <feature>"
git push
```

## No Traditional Testing
Note: This is a Neovim configuration, not an application. There are no unit tests or build steps. Verification is done through:
1. Neovim health checks (`:checkhealth`)
2. Manual testing of features
3. LSP diagnostics showing no errors in config files

## Common Issues to Check
- Lua syntax errors: `:messages` or `:checkhealth`
- Plugin loading issues: `:Lazy` UI shows errors
- LSP not working: `:LspInfo` and check Mason installation
- Formatter not working: `:ConformInfo` and verify Mason tools
- Keybinding conflicts: `:map <key>` to see what's mapped
