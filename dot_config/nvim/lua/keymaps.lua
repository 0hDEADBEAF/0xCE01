local opts = {
    noremap = true,
    silent = true,
}

-- AZERTY fixes
vim.keymap.set("n", "z", "w", opts) -- Move to next word
vim.keymap.set("n", "q", "a", opts) -- Enter insert mode after the cursor

-- Some nice bindings
vim.keymap.set("n", "<C-t>", ">>", opts) -- Adds a level of tabulation to the current line
vim.keymap.set("n", "<C-r>", "<<", opts) -- Removes a level of tabulation to the current line
vim.keymap.set("n", "<C-j>", "yyp", opts) -- Copies the current line down
vim.keymap.set("n", "<C-d>", "dd", opts) -- Removes the current line

-- Neo-tree
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", opts) -- Toggle Neotree

-- Terminal
vim.keymap.set("n", "<C-b>", ":ToggleTerm<CR>", opts) -- Toggle terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", opts) -- Exit terminal mode

-- Git
vim.keymap.set("n", "gl", ":Gitsigns preview_hunk<CR>", opts) -- Show current chunk changes from last version

-- LSP
vim.keymap.set("n", "qf", vim.lsp.buf.code_action, opts) -- Show available quickfixes to apply for current line
