return {
  "axkirillov/unified.nvim",
  opts = {
    signs = {
      add = "│",
      delete = "│",
      change = "│",
    },
    auto_refresh = true,
  },
  config = function(_, opts)
    require("unified").setup(opts)

    -- Add extra keymaps for unified_tree buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "unified_tree",
      callback = function(ev)
        local bopts = { buffer = ev.buf, silent = true }
        -- Enter key to open file and jump to diff pane
        vim.keymap.set("n", "<CR>", function()
          require("unified.file_tree.actions").toggle_node()
          -- Jump to the main diff window after opening
          local state = require("unified.state")
          local win = state.get_main_window()
          if win and vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_set_current_win(win)
          end
        end, bopts)
        -- Disable <C-n> so it doesn't open nvim-tree
        vim.keymap.set("n", "<C-n>", "<Nop>", bopts)
      end,
    })
  end,
  keys = {
    { "<C-d>", function()
      local state = require("unified.state")
      if state.is_active() then
        local config = require("unified.config")
        local ns_id = config.ns_id
        local hunk_store = require("unified.hunk_store")

        -- Clear diff decorations from ALL buffers, not just current one
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_clear_namespace(buf, ns_id, 0, -1)
            vim.fn.sign_unplace("unified_diff", { buffer = buf })
            hunk_store.clear(buf)
          end
        end

        -- Remove auto-refresh autocmd
        if state.auto_refresh_augroup then
          vim.api.nvim_del_augroup_by_id(state.auto_refresh_augroup)
          state.auto_refresh_augroup = nil
        end

        -- Close file tree window if it exists
        if state.file_tree_win and vim.api.nvim_win_is_valid(state.file_tree_win) then
          vim.api.nvim_win_close(state.file_tree_win, true)
        end

        -- Reset all state
        state.file_tree_win = nil
        state.file_tree_buf = nil
        state.main_win = nil
        state.set_active(false)
        state.set_backend("default")
      else
        local ok, commit_ref = pcall(state.get_commit_base)
        require("unified.command").run(ok and commit_ref or "")
      end
    end, desc = "Toggle inline diff" },
    { "]h", function() require("unified.navigation").next_hunk() end, desc = "Next hunk" },
    { "[h", function() require("unified.navigation").previous_hunk() end, desc = "Previous hunk" },
    { "gs", function() require("unified.hunk_actions").stage_hunk() end, desc = "Stage hunk" },
    { "gu", function() require("unified.hunk_actions").unstage_hunk() end, desc = "Unstage hunk" },
    { "gr", function() require("unified.hunk_actions").revert_hunk() end, desc = "Revert hunk" },
  },
  cmd = { "Unified" },
}
