-- lua/plugins/colors.lua
return {
	-- Nightfox (optional, still available)
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
		opts = {
			options = {
				terminal_colors = true,
				transparent = true,
			},
		},
	},

	-- TokyoNight (your new default)
	{
		"folke/tokyonight.nvim",
		lazy = false, -- load immediately
		priority = 1000, -- make sure it loads before others
		opts = {
			style = "storm", -- "storm", "moon", "night", "day"
			transparent = true,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight") -- set as default
		end,
	},
}
