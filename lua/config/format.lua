local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.clang_format.with({
            filetypes = { "c", "cpp" },
            extra_args = { "--style=LLVM" }, -- Adjust the style as needed
        }),
    },
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
    end,
})
