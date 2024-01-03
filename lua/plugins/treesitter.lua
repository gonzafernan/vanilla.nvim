-- Treesitter: nvim-treesitter (https://github.com/nvim-treesitter/nvim-treesitter)
-- Interface for tree-sitter (basic functionalities such as highlighting)
-- Command :TSUpdate

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            -- A list of parser names, or "all" (the five listed parsers should always be installed)
            ensure_installed = { "c", "lua", "vim", "python", "markdown" },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
