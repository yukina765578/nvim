return {
	-- Install nightfox
	"EdenEast/nightfox.nvim",
	config = function()
		require("nightfox").setup({
			options = {
				terminal_colors = true,
				transparent = true,
			},
		})
		vim.cmd("colorscheme dawnfox")
	end,
}
