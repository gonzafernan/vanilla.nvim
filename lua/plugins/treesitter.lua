-- Treesitter: nvim-treesitter (https://github.com/nvim-treesitter/nvim-treesitter)
-- Interface for tree-sitter (basic functionalities such as highlighting)
-- Command :TSUpdate

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "lua", "vim", "python" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
