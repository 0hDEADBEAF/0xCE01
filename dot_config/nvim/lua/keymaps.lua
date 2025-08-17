local opts = {
	noremap = true,
	silent = true,
}

-- Unmapping conflicting keybindings
-- vim.keymap.del("i", "<C-l>");


-- Settings Insert Mode keybindings
vim.keymap.set("n", "<C-t>", ">>", opts) -- Adds a level of tabulation to the current line
vim.keymap.set("n", "<C-r>", "<<", opts) -- Removes a level of tabulation to the current line
vim.keymap.set("n", "<C-j>", "yyp", opts) -- Copies the current line down
vim.keymap.set("n", "<C-d>", "dd", opts) -- Removes the current line
