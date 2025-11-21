return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						-- See the configuration section for more details
						-- Load luvit types when the `vim.uv` word is found
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local formatting = require("lsp.formatting")

			lspconfig.lua_ls.setup({
				on_attach = formatting.on_attach,
			})
			lspconfig.ruff.setup({
				on_attach = formatting.on_attach,
			})
			lspconfig.pyright.setup({
				on_attach = formatting.on_attach,
			})
			-- tinymist configuration: https://myriad-dreamin.github.io/tinymist/frontend/neovim.html
			lspconfig.tinymist.setup({
				on_attach = formatting.on_attach,
				settings = {
					formatterMode = "typstyle",
					exportPdf = "onSave",
					semanticTokens = "disable",
				},
			})

			lspconfig.verible.setup({
				cmd = { "verible-verilog-ls" },
				on_attach = formatting.on_attach,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
