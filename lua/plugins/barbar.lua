return {
  "romgrk/barbar.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = true,
    insert_at_end = true,
    icons = {
      buffer_index = true,
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true },
        [vim.diagnostic.severity.WARN] = { enabled = true },
      },
    },
  },
  keys = {
    { "[b", "<cmd>BufferPrevious<CR>", desc = "Previous buffer" },
    { "]b", "<cmd>BufferNext<CR>", desc = "Next buffer" },
    { "<leader>bh", "<cmd>BufferMovePrevious<CR>", desc = "Move buffer left" },
    { "<leader>bl", "<cmd>BufferMoveNext<CR>", desc = "Move buffer right" },
    { "<leader>bp", "<cmd>BufferPin<CR>", desc = "Pin buffer" },
    { "<leader>bc", "<cmd>BufferClose<CR>", desc = "Close buffer" },
    { "<leader>bo", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = "Close other unpinned buffers" },
    { "<leader>bs", "<cmd>BufferPick<CR>", desc = "Select buffer" },
    { "<leader>bD", "<cmd>BufferPickDelete<CR>", desc = "Delete selected buffer" },
  },
}
