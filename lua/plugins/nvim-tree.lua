return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- essential settings from nvim-tree official docs
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- customize folder arrow icons with nice glyphs
      renderer = {
        highlight_git = "name",
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            git = true,
          },
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "",   -- arrow when folder is open
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = {
          ".DS_Store",
          -- Unity-specific files we want to hide
          "*.meta",
          "*.prefab",
          "*.unity",
          "*.asset",
          "Library",
          "Temp",
          "Logs",
          "UserSettings",
          "obj",
          "bin",
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<C-n>", function()
      -- If unified tree is open, jump to it instead
      local ok, tree_state = pcall(require, "unified.file_tree.state")
      if ok and tree_state.window and vim.api.nvim_win_is_valid(tree_state.window) then
        vim.api.nvim_set_current_win(tree_state.window)
        return
      end
      vim.cmd("NvimTreeToggle")
    end)
  end
}

