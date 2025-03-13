return {
  "nvim-treesitter/nvim-treesitter", 
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "css",
        "lua",
        "python",
        "json",
        "javascript",
        "typescript",
        "markdown",
      },
      highlight = {
        enable = true,
      },
    })
  end,
}
