-- Colorscheme: catppuccin (https://github.com/catppuccin/nvim)
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			integrations = {
				cmp = true,
				gitsigns = true,
				treesitter = true,
				notify = false,
				telescope = {
					enabled = true,
				},
                mason = true,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
