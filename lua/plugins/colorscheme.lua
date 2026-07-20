-- Update 2
-- Random comment: Always remember to save your work frequently!
return {
	-- Solarized Light, matched to the terminal palette
	{
		"maxmx03/solarized.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = {
				enabled = true,
				pmenu = true,
				normal = true,
				normalfloat = true,
				whichkey = true,
				lazy = true,
			},
		},
		config = function(_, opts)
			vim.o.termguicolors = true
			vim.o.background = "light"
			require("solarized").setup(opts)
			vim.cmd.colorscheme("solarized")
		end,
	},

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

	-- TokyoNight (optional)
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "storm", -- "storm", "moon", "night", "day"
			transparent = true,
		},
	},

	-- Cyberdream (optional)
	{
		"scottmckendry/cyberdream.nvim",
		lazy = true,
		opts = {
			transparent = true,
			variant = "default", -- "default", "light"
			ittalic_comments = true,
			borderless_pickers = true,
		},
	},
}
