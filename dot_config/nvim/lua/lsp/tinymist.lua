vim.lsp.config.tinymist = {
    cmd = { 'tinymist' },
    filetypes = {
        'typst'
    },
    settings = {
        compileStatus = "disable",
        completion =  {
            postfix = true,
            postfixUfcs = true,
            postfixUfcsLeft = true,
            symbol = "step",
            triggerOnSnippetPlaceholders = false
        },
        exportPdf = false,
        exportTarget = "paged",
        formatterMode = "typstyle",
        formatterIndentSize = 2,
        formatterPrintWidth = 80,
        formatterProseWrap = true,
        lint = {
            enabled = true,
            when = "onSave"
        },
        projectResolution = "singleFile",
        semanticTokens = "enable",
        systemFonts = true
    }
}

vim.lsp.enable("tinymist")
