-- Null-ls (deprecated): none-ls.nvim (https://github.com/nvimtools/none-ls.nvim)
return {
	{
		"nvimtools/none-ls.nvim",
		commit = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format()
							end,
						})
					end
				end,
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
				},
			})
		end,
	},
}
