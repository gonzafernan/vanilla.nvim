local M = {}

-- Global toggle
_G.disable_autoformat = false

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				if not _G.disable_autoformat then
					vim.lsp.buf.format({})
				end
				vim.lsp.buf.format({
					bufnr = bufnr,
					async = false,
					filter = function(c)
						if vim.bo[bufnr].filetype == "python" then
							return c.name == "ruff"
						end
						return true
					end,
				})
			end,
		})
	end
end

M.toggle_autoformat = function()
	_G.disable_autoformat = not _G.disable_autoformat
	vim.notify("Autoformatting " .. (_G.disable_autoformat and "disabled" or "enabled"))
end

return M
