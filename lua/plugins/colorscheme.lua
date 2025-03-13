return {
  -- Install nightfox
  "EdenEast/nightfox.nvim",
  config = function()
    require("nightfox").setup({
      fox = "nightfox",
      options = {
        terminal_colors = true,
        transparent = true,
      }
    })
    vim.cmd("colorscheme nightfox")
  end,
}
