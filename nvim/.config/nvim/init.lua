-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Source non-plugin configs
require("dbarbosa.options")
require("dbarbosa.keymaps")

--[[ Start Neovim Plugin Section ]] --
-- DO NOT TOUCH, LazyVim Bootstrapping
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
require("lazy").setup("dbarbosa.plugins")

-- Source colorscheme config
require("dbarbosa.configs.kanagawa")
vim.cmd("colorscheme kanagawa")

-- Source per-plugin config
require("dbarbosa.configs.lualine")
vim.o.laststatus = 3 -- Force laststatus overwrite
require("dbarbosa.configs.blankline")
require("dbarbosa.configs.nvim-tree")
require("dbarbosa.configs.treesitter")
require("dbarbosa.configs.mason")
