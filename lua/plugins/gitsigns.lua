return {
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	opts = {
		-- See `:help gitsigns.txt`
		on_attach = function(bufnr)
			vim.keymap.set(
				"n",
				"<leader>hp",
				require("gitsigns").preview_hunk,
				{ buffer = bufnr, desc = "Preview git hunk" }
			)
		end,
	},
}
