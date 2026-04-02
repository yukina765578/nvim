return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open Lazy Git" },
    {
      "<leader>lr",
      function()
        local cwd = vim.fn.getcwd()
        local dirs = vim.fn.globpath(cwd, "**/.git", false, true)
        local repos = vim.tbl_map(function(d)
          return vim.fn.fnamemodify(d, ":h")
        end, dirs)

        if #repos == 0 then
          vim.notify("No git repos found in " .. cwd, vim.log.levels.WARN)
          return
        end

        Snacks.picker.select(repos, { prompt = "Select Repo for LazyGit" }, function(selected)
          if selected then
            require("lazygit").lazygit(selected)
          end
        end)
      end,
      desc = "LazyGit repo picker",
    },
  },
}
