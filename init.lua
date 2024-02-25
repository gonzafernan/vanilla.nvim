vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.number = true -- make line numbers default
vim.opt.relativenumber = true -- relative line number
vim.o.hlsearch = false -- set highlight on search

vim.cmd("set expandtab") -- replace tab with spaces
vim.cmd("inoremap jk <esc>") -- better escape

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

-- tab with 4 spaces
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Package manager: lazy.nvim (https://github.com/folke/lazy.nvim)
-- Command :Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup("plugins")
