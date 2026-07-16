local function navigate_hunk(direction, fallback)
  local state = require("unified.state")
  if not state.is_active() then
    vim.api.nvim_feedkeys(vim.keycode(fallback), "n", false)
    return
  end

  -- If invoked from the file tree, navigate in the main diff window.
  if vim.bo.filetype == "unified_tree" then
    local win = state.get_main_window()
    if win and vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_set_current_win(win)
    end
  end

  local navigation = require("unified.navigation")
  if direction > 0 then
    navigation.next_hunk()
  else
    navigation.previous_hunk()
  end
end

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
        local function open_file()
          require("unified.file_tree.actions").toggle_node()

          -- Jump to the main diff window after opening
          local state = require("unified.state")
          local win = state.get_main_window()
          if win and vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_set_current_win(win)
          end
        end

        -- Open the selected file and jump to its diff.
        vim.keymap.set("n", "<CR>", open_file, bopts)

        -- A single click selects; a double-click opens the file's diff.
        vim.keymap.set("n", "<2-LeftMouse>", function()
          local mouse = vim.fn.getmousepos()
          if mouse.winid == 0 or mouse.line == 0 or not vim.api.nvim_win_is_valid(mouse.winid) then
            return
          end

          local mouse_buf = vim.api.nvim_win_get_buf(mouse.winid)
          if vim.bo[mouse_buf].filetype ~= "unified_tree" then
            return
          end

          vim.api.nvim_set_current_win(mouse.winid)
          local line = vim.api.nvim_buf_get_lines(mouse_buf, mouse.line - 1, mouse.line, false)[1] or ""
          local column = math.min(math.max(mouse.column - 1, 0), #line)
          vim.api.nvim_win_set_cursor(mouse.winid, { mouse.line, column })
          open_file()
        end, bopts)
      end,
    })
  end,
  keys = {
    { "<leader>gd", function()
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
    { "<Tab>", function() navigate_hunk(1, "<C-i>") end, desc = "Next hunk" },
    { "<S-Tab>", function() navigate_hunk(-1, "<S-Tab>") end, desc = "Previous hunk" },
    { "gs", function() require("unified.hunk_actions").stage_hunk() end, desc = "Stage hunk" },
    { "gu", function() require("unified.hunk_actions").unstage_hunk() end, desc = "Unstage hunk" },
    { "gr", function() require("unified.hunk_actions").revert_hunk() end, desc = "Revert hunk" },
  },
  cmd = { "Unified" },
}
