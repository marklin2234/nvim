return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                c = { "clang_format" },
                cpp = { "clang_format" },
                h = { "clang_format" },
                hpp = { "clang_format" },
                python = { "black" }
            },

            -- formatters = {
            --     clang_format = {
            --         prepend_args = { "--style=LLVM" },
            --     },
            -- },
        },
    },
}
