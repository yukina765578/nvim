return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "css",
      "lua",
      "python",
      "json",
      "javascript",
      "typescript",
      "markdown",
      "c_sharp",
    },
    highlight = {
      enable = true,
    },
  },
}
