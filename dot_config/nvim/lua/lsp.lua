require("lsp/clangd")
require("lsp/ty")
require("lsp/tinymist")

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
