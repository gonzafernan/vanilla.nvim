-- Null-ls (deprecated): none-ls.nvim (https://github.com/nvimtools/none-ls.nvim)
return {
    {
        "nvimtools/none-ls.nvim",
        commit = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local null_ls = require("null-ls")
            local formatting = require("lsp.formatting")

            null_ls.setup({
                on_attach = formatting.on_attach,
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
                    -- Typst
                    null_ls.builtins.formatting.typstyle.with({
                        command = "typstyle",
                        filetypes = { "typst" },
                    }),
                    -- Verilog
                    null_ls.builtins.formatting.verible_verilog_format,
                },
            })
        end,
    },
}
