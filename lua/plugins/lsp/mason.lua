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
			},
			-- Automatically enable installed servers
			automatic_enable = true,
		})
	end,
}
