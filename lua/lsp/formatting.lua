local M = {}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

M.on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
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
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	vim.notify("Autoformat (global) " .. (vim.g.disable_autoformat and "disabled" or "enabled"))
end

M.toggle_autoformat_buffer = function()
	vim.b.disable_autoformat = not vim.b.disable_autoformat
	vim.notify("Autoformat (buffer) " .. (vim.b.disable_autoformat and "disabled" or "enabled"))
end

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, { desc = "Disable autoformat-on-save (bang for current buffer only)", bang = true })

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, { desc = "Re-enable autoformat-on-save" })

return M
