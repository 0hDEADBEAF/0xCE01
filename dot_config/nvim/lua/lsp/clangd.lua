-- Clangd
vim.lsp.config.clangd = {
	root_markers = {
		'.clang-format',
		'compile_commands.json'
	},
	cmd = { 'clangd' },
	filetypes = {
		'cpp',
		'c'
	},
	capabilities = {
		textDocument = {
			completion = {
				completionItem = {
					snippetSupport = true
				}
			}
		}
	}
}

vim.lsp.enable('clangd')
