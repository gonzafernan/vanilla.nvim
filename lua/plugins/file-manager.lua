-- Yazi: yazi.nvim (https://github.com/mikavilpas/yazi.nvim)
-- Blazing fast file manager for the terminal

return {
    {
        "mikavilpas/yazi.nvim",
        -- Pinned: v10.3.0 is the last tag before yazi.nvim started requiring
        -- Neovim 0.11+ (the `winborder` option, hard-required as of commit
        -- bab15dad, and a separate 0.10 compatibility shim in its process
        -- handling dropped in 97039da). This Nix setup pins Neovim to 0.10.2
        -- (nixos-24.11 stable) deliberately — nixos-unstable's newer Neovim
        -- broke this same config's Lua module loading previously — so this
        -- plugin needs to stay behind that line too until Neovim is upgraded.
        tag = "v10.3.0",
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
        },
        keys = {
            {
                "<leader>-",
                mode = { "n", "v" },
                "<cmd>Yazi<cr>",
                desc = "Open yazi at the current file",
            },
            {
                "<leader>cw",
                "<cmd>Yazi cwd<cr>",
                desc = "Open the file manager in nvim's working directory",
            },
            {
                "<c-up>",
                "<cmd>Yazi toggle<cr>",
                desc = "Resume the last yazi session",
            },
        },
        opts = {
            open_for_directories = false,
            keymaps = {
                show_help = "<f1>",
            },
        },
        init = function()
            vim.g.loaded_netrwPlugin = 1
        end,
    },
}
