local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.clang_format.with({
            filetypes = { "c", "cpp" },
            extra_args = { "--style=LLVM" }, -- Adjust the style as needed
        }),
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            -- Format on save (async in 0.8+, sync removed in 0.10+)
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
