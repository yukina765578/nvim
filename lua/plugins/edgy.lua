return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	opts = {
		-- Configure right side for Claude Code terminal
		right = {
			{
				-- Claude Code terminal configuration
				title = "Claude Code",
				ft = "terminal", -- Terminal filetype
				size = { width = 0.2 }, -- Fixed 30% width
				filter = function(buf, win)
					-- Get buffer name
					local bufname = vim.api.nvim_buf_get_name(buf)

					-- Check if it's a terminal buffer
					local is_terminal = vim.bo[buf].buftype == "terminal"

					-- Check if it's related to Claude Code
					-- This will match terminals with "claude" in the name
					local is_claude = bufname:lower():match("claude") ~= nil

					-- Check window config to ensure it's not a floating window
					local win_config = vim.api.nvim_win_get_config(win)
					local is_not_float = win_config.relative == ""

					return is_terminal and is_claude and is_not_float
				end,
				-- Prevent resizing
				pinned = true,
				open = function()
					vim.cmd("ClaudeCode")
				end,
			},
			{
				-- Snacks terminal integration (if using snacks provider)
				ft = "snacks_terminal",
				size = { width = 0.2 },
				title = "%{b:snacks_terminal.id}: %{b:term_title}",
				filter = function(_buf, win)
					-- Check if it's a snacks terminal window positioned on the right
					return vim.w[win].snacks_win
						and vim.w[win].snacks_win.position == "right"
						and vim.w[win].snacks_win.relative == "editor"
						and not vim.w[win].trouble_preview
				end,
			},
		},
		-- Configure other sides as empty to prevent interference
		bottom = {},
		left = {},
		top = {},
		-- Global edgy options
		options = {
			-- Ensure windows don't resize
			left = { size = 0 },
			bottom = { size = 0 },
			right = { size = 0 },
			top = { size = 0 },
		},
		-- Keymaps (optional but useful)
		keys = {
			-- Close edgy window
			["<c-q>"] = function(win)
				win:close()
			end,
			-- Hide edgy window
			["q"] = function(win)
				win:hide()
			end,
			-- Navigate between edgy windows
			["]w"] = function(win)
				win:next({ visible = true, focus = true })
			end,
			["[w"] = function(win)
				win:prev({ visible = true, focus = true })
			end,
		},
	},
}
