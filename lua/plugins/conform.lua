-- Replaces none-ls (https://github.com/stevearc/conform.nvim).
return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	-- cmd registers these eagerly so they work before the first BufWritePre fires.
	cmd = { "ConformInfo", "FormatDisable", "FormatEnable" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			yaml = { "yamlfmt" },
			typst = { "typstyle" },
			verilog = { "verible" },
			python = { "ruff_format" },
		},
		format_on_save = function(bufnr)
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
	},
	config = function(_, opts)
		require("conform").setup(opts)

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
	end,
}
