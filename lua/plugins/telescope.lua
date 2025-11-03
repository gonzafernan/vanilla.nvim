-- Telescope: telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)
-- Fuzzyfind tool

return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Search files across project" })
			vim.keymap.set("n", "<leader>fl", builtin.git_files, { desc = "Search files across git project" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search with live grep across project" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Search buffers opened" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search neovim help" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Search word under cursor" })

			local function select_dir_and_live_grep()
				builtin.find_files({
					prompt_title = "Select directory to live grep",
					find_command = (vim.fn.executable("fd") == 1)
							and { "fd", "--type", "d", "--hidden", "--exclude", ".git" }
						or { "find", ".", "-type", "d", "-not", "-path", "*/.git/*" },
					no_ignore = true,
					hidden = true,
					previewer = false,
					attach_mappings = function(prompt_bufnr, map)
						local actions = require("telescope.actions")
						local action_state = require("telescope.actions.state")
						local function live_grep()
							local entry = action_state.get_selected_entry()
							actions.close(prompt_bufnr)
							-- depend on the picker: entry = { path = "/home/user/project/src" } or entry = { "/home/user/project/src" }
							local dir = entry and (entry.path or entry[1])
							if dir then
								builtin.live_grep({ cwd = dir })
							else
								vim.notify("No directory selected", vim.log.levels.WARN)
							end
						end
						map("i", "<CR>", live_grep)
						map("n", "<CR>", live_grep)
						return true
					end,
				})
			end

			vim.keymap.set(
				"n",
				"<leader>fd",
				select_dir_and_live_grep,
				{ desc = "Select directory and search with grep" }
			)
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					-- Optional: ignore these directories
					file_ignore_patterns = { "%.git/" },
				},
				pickers = {
					find_files = {
						hidden = true,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),

						-- pseudo code / specification for writing custom displays, like the one
						-- for "codeactions"
						-- specific_opts = {
						--   [kind] = {
						--     make_indexed = function(items) -> indexed_items, width,
						--     make_displayer = function(widths) -> displayer
						--     make_display = function(displayer) -> function(e)
						--     make_ordinal = function(e) -> string
						--   },
						--   -- for example to disable the custom builtin "codeactions" display
						--      do the following
						--   codeactions = false,
						-- }
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
		end,
	},
}
