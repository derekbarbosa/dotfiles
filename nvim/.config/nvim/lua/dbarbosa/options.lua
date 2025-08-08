local opt = vim.opt
local o = vim.o
local cmd = vim.cmd

-- IFDEF General Vim Settings
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.confirm = true            -- Confirm to save changes before exiting modified buffer
opt.grepprg = "rg --vimgrep"
opt.mouse = "a"               -- Enable mouse mode
opt.spelllang = { "en" }
opt.shellcmdflag = '-ic'
opt.showcmd = true
opt.timeoutlen = 400
opt.undolevels = 10000
-- ENDIF

-- IFDEF tab and spacing configs
opt.textwidth = 80     -- Wrap after 80 chars
opt.smartindent = true -- Insert indents automatically

-- Will be overwritten by LinuxTabs
opt.expandtab = false -- Convert tabstops to spaces when hitting TAB
opt.tabstop = 4       -- Size of an indent
opt.shiftwidth = 4    -- Size of an indent
opt.softtabstop = 4
--- END

-- ENDIF

-- IFDEF Neovim 'UI' Settings
o.background = 'dark'
opt.conceallevel = 3          -- Hide * markup for bold and italic
opt.guicursor = "n-v-c:block-blinkwait250-blinkoff150-blinkon175,i-ci-cr:hor50-blinkoff50-blinkon75"
opt.list = true               -- Show some invisible characters (tabs...)
opt.pumblend = 10  -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.signcolumn = "yes"        -- Always show the signcolumn, otherwise it would shift the text each time
opt.termguicolors = true -- True color support
-- ENDIF

-- IFDEF Autocommands

-- Linux Styling Autocommands
vim.api.nvim_create_augroup("LinuxTabs", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = "LinuxTabs",
	pattern = { "*.c", "*.h", "*kconfig", "*.rst", "*.diff", "*.dts" },
	callback = function()
		opt.tabstop = 8   -- Size of an indent
		opt.shiftwidth = 8 -- Size of an indent
		opt.softtabstop = 8
		opt.expandtab = false -- Convert tabstops to spaces when hitting TAB
		cmd('LinuxCodingStyle') -- This may be uneeded
	end
})

-- Statusline Tweaks Autocommands
vim.api.nvim_create_augroup("StatusLine", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	group = "StatusLine",
	callback = function()
		cmd('hi StatusLineNC guibg=NONE')
		cmd('hi StatusLine guibg=NONE')
	end
})
-- ENDIF
