vim.lsp.config.ty = {
	root_markers = {
		'pyproject.toml',
		'ty.toml'
	},
	filetypes = {
		'python'
	},
	cmd = { 'ty', 'server' },
	settings = {
		ty = {
		}
	}
}

vim.lsp.enable('ty')
