require("lsp/clangd")
require("lsp/ty")
require("lsp/neocmake")

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
