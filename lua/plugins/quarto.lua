-- Quarto: scientific/technical publishing with executable code cells
-- https://quarto.org/docs/tools/neovim.html
-- Commands: :QuartoPreview, :QuartoRender, :QuartoActivate

return {
	{
		"quarto-dev/quarto-nvim",
		ft = { "quarto" },
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("quarto").setup({
				lspFeatures = {
					enabled = true,
					languages = { "python" },
					chunks = "all",
					diagnostics = {
						enabled = true,
						triggers = { "BufWritePost" },
					},
					completion = { enabled = true },
				},
				codeRunner = { enabled = false },
			})
		end,
	},
}
