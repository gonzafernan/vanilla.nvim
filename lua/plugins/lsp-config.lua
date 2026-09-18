return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
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
			-- Native vim.lsp.config/enable (0.11+); capabilities apply to every
			-- server via '*' instead of being repeated per-server.
			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			-- No PDF sync exists for Typst+Zathura (SyncTeX is TeX-only); <leader>tp
			-- just opens Zathura, which reloads on its own after each save.
			vim.lsp.config("tinymist", {
				on_attach = function(_, bufnr)
					vim.keymap.set("n", "<leader>tp", function()
						local pdf = vim.fn.expand("%:p:r") .. ".pdf"
						vim.fn.jobstart({ "zathura", pdf }, { detach = true })
					end, { buffer = bufnr, desc = "Preview Typst PDF in Zathura" })
				end,
				settings = {
					formatterMode = "typstyle",
					exportPdf = "onSave",
					semanticTokens = "disable",
				},
			})

			vim.lsp.config("verible", { cmd = { "verible-verilog-ls" } })

			-- Format-on-save is handled by conform.nvim (plugins/conform.lua), not here.
			vim.lsp.enable({
				"lua_ls",
				"bashls",
				"clangd",
				"texlab",
				"ruff",
				"pyright",
				"tinymist",
				"verible",
				"zls",
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
