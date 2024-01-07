-- Null-ls (deprecated): none-ls.nvim (https://github.com/nvimtools/none-ls.nvim)
return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    -- Prettier
                    null_ls.builtins.formatting.prettier,

                    -- Lua
                    null_ls.builtins.formatting.stylua,

                    -- Python
                    null_ls.builtins.formatting.black,
                    null_ls.builtins.formatting.isort,
                },
            })

            vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
        end
    },
}
