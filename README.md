# vanilla.nvim

Personal Neovim configuration. Lua-based, managed with [Lazy.nvim](https://github.com/folke/lazy.nvim), themed with [Catppuccin Mocha](https://github.com/catppuccin/nvim).

## Highlights

- **LSP**: `nvim-lspconfig` with `lua_ls`, `pyright`, `ruff`, `tinymist`, `verible`
- **Completion**: `nvim-cmp` + `LuaSnip` + `friendly-snippets`
- **Treesitter**: `nvim-treesitter` with parsers for C/C++, Lua, Python, Markdown, YAML, Bash, etc.
- **UI**: Catppuccin Mocha, Lualine, Telescope, which-key, markview
- **Other**: file manager, version control integration, tabular data, Comment.nvim, autopairs

## Integrations

### Quarto

Editing [Quarto](https://quarto.org) documents (`.qmd`) is supported via [`quarto-nvim`](https://github.com/quarto-dev/quarto-nvim) + [`otter.nvim`](https://github.com/jmbuhr/otter.nvim). Otter provides LSP, completion, and diagnostics inside embedded code cells by routing them to the underlying language servers (e.g. `pyright`/`ruff` for Python).

Common commands:

- `:QuartoPreview` — start a live-reloading browser preview
- `:QuartoRender` — render the output document

External dependencies (not installed by this config):

- [`quarto`](https://quarto.org/docs/get-started/) CLI on `PATH`
- For Python cells: `jupyter` + `ipykernel` in the active Python environment
