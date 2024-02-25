-- Null-ls (deprecated): none-ls.nvim (https://github.com/nvimtools/none-ls.nvim)
return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- Lua
                    null_ls.builtins.formatting.stylua,
                    -- Python
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                    -- C/C++
                    null_ls.builtins.formatting.clang_format,
                    -- YAML
                    null_ls.builtins.formatting.yamlfmt,
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end,
    },
}
