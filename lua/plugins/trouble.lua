return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  opts = {
    focus = true,
    auto_preview = false, -- don't auto-jump into the file as the cursor moves; use <cr>/o/p instead
  },
  cmd = "Trouble",
  keys = {
    { "<leader>xw", "<cmd>Trouble diagnostics toggle<CR>", desc = "Open trouble workspace diagnostics" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Open trouble document diagnostics" },
    { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", desc = "Open trouble quickfix list" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Open trouble location list" },
    {
      "<leader>xt",
      function()
        local trouble = require("trouble")
        if vim.bo.filetype == "trouble" then
          -- focused inside the Trouble window: close it
          trouble.close("todo")
        elseif trouble.is_open("todo") then
          -- open but focused elsewhere: jump back into it instead of closing
          trouble.open("todo")
        else
          -- Trouble forces foldlevel back to 99 on open, so collapse manually
          -- once the first render is done (level 0 = only keyword groups shown).
          local view = trouble.open("todo")
          if view then
            view:wait(function()
              view:fold_level({ level = 0 })
            end)
          end
        end
      end,
      desc = "Open/focus todos in trouble (collapsed)",
    },
  },
}
