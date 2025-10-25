-- Update 2
-- Random comment: Always remember to save your work frequently!
return {
	-- Gruvbox theme (primary colorscheme for testing ClaudeCode.nvim)
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			terminal_colors = true,
			transparent_mode = true,
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			bold = true,
			italic = {
				strings = false,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
		},
		config = function(_, opts)
			require("gruvbox").setup(opts)
			vim.cmd.colorscheme("gruvbox")
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
