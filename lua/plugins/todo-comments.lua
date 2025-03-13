return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "]t", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    keymap.set("n", "[t", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,

  -- Example of todo-comments
  -- TODO: This is a todo comment
  -- FIXME: This is a fixme comment
  -- HACK: This is a hack comment
  -- XXX: This is a warning comment
  -- WARN: This is a warning comment
  -- BUG: This is a bug comment
  -- PERF: This is a performance comment
  -- NOTE: This is a note comment
  -- TEST: This is a test comment
}
