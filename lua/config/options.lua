vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
-- First random comment: Testing diff pane with multiple edits!
vim.cmd("set number relativenumber")
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Hide end of buffer ~ characters
vim.opt.fillchars = { eob = " " }

-- Random comment: This is a test comment to check the diff pane functionality!

-- Disable folding to show full file in diff views
vim.opt.foldenable = false

-- Diff mode: show full file without folding unchanged sections
vim.opt.diffopt:remove("filler")
vim.opt.diffopt:append("context:999999") -- large number to show all lines
vim.opt.diffopt:append("foldcolumn:0")

-- Enable line wrapping in diff mode
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "diff",
	callback = function()
		if vim.wo.diff then
			vim.wo.wrap = true
		end
	end,
})

-- Auto-reload files when changed externally
vim.opt.autoread = true
-- Random comment: The quick brown fox jumps over the lazy dog!
-- Second random comment: Another test comment for diff visualization!

-- Check for external file changes on these events
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
	callback = function()
		if vim.fn.mode() ~= "c" then
			vim.cmd("checktime")
		end
	end,
})

-- Notify when file changes externally
vim.api.nvim_create_autocmd("FileChangedShellPost", {
	callback = function()
		vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
	end,
})

-- Edgy.nvim compatible settings
vim.opt.laststatus = 3 -- Global statusline (required for edgy.nvim)
vim.opt.splitkeep = "screen" -- Prevent layout jumping when opening/closing windows

-- Clipboard configuration for WSL2
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
	name = "WslClipboard",
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
	},
	paste = {
		["+"] = "win32yank.exe -o --lf",
		["*"] = "win32yank.exe -o --lf",
	},
	cache_enabled = 0,
}
