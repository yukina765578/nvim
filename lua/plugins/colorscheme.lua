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
		opts = {
			style = "storm", -- "storm", "moon", "night", "day"
			transparent = true,
		},
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			variant = "default", -- "default", "light"
			ittalic_comments = true,
			borderless_pickers = true,
		},
		config = function(_, opts)
			require("cyberdream").setup(opts)
			vim.cmd.colorscheme("cyberdream") -- set as default
		end,
	},
}
