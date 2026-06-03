return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		-- Setup mason
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		-- Setup mason-lspconfig
		require("mason-lspconfig").setup({
			-- List of servers to automatically install
			ensure_installed = {
				"lua_ls",
				"pyright",
				"biome",
			},
			-- Automatically enable installed servers
			automatic_enable = true,
		})

		-- automatic_enable handles server setup on Neovim 0.11+
	end,
}
