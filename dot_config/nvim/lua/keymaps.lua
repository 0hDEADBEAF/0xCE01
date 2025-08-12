local opts = {
	noremap = true,
	silent = true,
}

-- Unmapping conflicting keybindings
-- vim.keymap.del("i", "<C-l>");


-- Settings Insert Mode keybindings
vim.keymap.set("n", "<C-t>", ">>", opts)
vim.keymap.set("n", "<C-r>", "<<", opts)
vim.keymap.set("n", "<C-j>", "yyp", opts)
vim.keymap.set("n", "<C-d>", "dd", opts)
