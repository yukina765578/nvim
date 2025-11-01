vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.api.nvim_set_keymap("n", "<C-p>", ":", { noremap = true, silent = false })

local keymap = vim.keymap -- for conciseness

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management w = window
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>wq", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- tab management t = tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Paste from clipboard in insert and terminal modes
keymap.set("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })
keymap.set("t", "<C-v>", "<C-\\><C-r>+", { noremap = true, silent = true })

-- Exit insert mode with Ctrl+Space
keymap.set("i", "<C-Space>", "<Esc>", { desc = "Exit insert mode to normal mode" })

-- Exit terminal mode with Ctrl+Space (doesn't send ESC to the program)
keymap.set("t", "<C-Space>", "<C-\\><C-n>", { desc = "Exit terminal mode to normal mode" })

-- Function to position current line N lines from top using count
local function position_with_count()
	local count = vim.v.count == 0 and 5 or vim.v.count -- Default to 5 if no count given

	-- Get current cursor position
	local cursor_line = vim.fn.line(".")

	-- Set the window so cursor line appears N lines from top
	vim.fn.winrestview({
		topline = math.max(1, cursor_line - count + 1),
		lnum = cursor_line,
		col = vim.fn.col(".") - 1,
	})
end

-- Map z followed by Enter to position that many lines from top
vim.keymap.set("n", "z<CR>", position_with_count, { desc = "Position line N from top (5z<CR> = 5 lines from top)" })
