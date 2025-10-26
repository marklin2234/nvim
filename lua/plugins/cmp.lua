return {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
        local cmp = require("cmp")

        opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
            ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            ["<S-Enter>"] = cmp.mapping.confirm({ select = true }),
            ["<CR>"] = cmp.mapping(function(fallback)
                fallback() -- do the normal Enter behavior (line break)
            end, { "i", "s" }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                fallback() -- Tab does normal indenting
            end, { "i", "s" }),
        })
    end,
}
