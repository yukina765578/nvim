return {
	"github/copilot.vim",
	init = function()
		-- Must be set before the plugin loads
		vim.g.copilot_no_tab_map = true
	end,
	config = function()
		local opts = { expr = true, silent = true, replace_keycodes = false }

		-- Accept full suggestion (safe key; <C-Tab> is flaky in terminals)
		vim.keymap.set(
			"i",
			"<Tab>",
			'copilot#Accept("\\t")',
			vim.tbl_extend("force", opts, {
				desc = "Copilot: accept full suggestion",
			})
		)

		-- Accept next word (partial accept)
		vim.keymap.set(
			"i",
			"<M-w>",
			"copilot#AcceptWord()",
			vim.tbl_extend("force", opts, {
				desc = "Copilot: accept next word",
			})
		)
		-- Accept current line
		vim.keymap.set(
			"i",
			"<S-Tab>",
			"copilot#AcceptLine()",
			vim.tbl_extend("force", opts, {
				desc = "Copilot: accept line",
			})
		)

		-- Cycle suggestions
		vim.keymap.set("i", "<M-]>", "copilot#Next()", vim.tbl_extend("force", opts, { desc = "Copilot: next" }))
		vim.keymap.set(
			"i",
			"<M-[>",
			"copilot#Previous()",
			vim.tbl_extend("force", opts, { desc = "Copilot: previous" })
		)

		-- Dismiss (not expr)
		vim.keymap.set("i", "<M-\\>", "<Cmd>call copilot#Dismiss()<CR>", { silent = true, desc = "Copilot: dismiss" })
	end,
}
