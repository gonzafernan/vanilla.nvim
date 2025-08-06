-- Lualine: luaine.nvim (https://github.com/nvim-lualine/lualine.nvim)
return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "catppuccin",
            },
        })
    end,
}
