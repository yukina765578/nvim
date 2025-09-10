-- lua/plugins/nvim-ufo.lua
return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		-- Recommended settings
		vim.o.foldcolumn = "1" -- show fold column
		vim.o.foldlevel = 99 -- unfold by default
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Use treesitter as main provider, fallback to indent
		require("ufo").setup({
			provider_selector = function(_, _, _)
				return { "treesitter", "indent" }
			end,
		})

		-- Keymaps for convenience
		vim.keymap.set("n", "zR", require("ufo").openAllFolds) -- open all
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds) -- close all
		vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds) -- open folds except comments
		vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- close folds with certain kinds
	end,
}
