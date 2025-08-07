local opt = vim.opt
local o = vim.o
local cmd = vim.cmd

opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.list = true               -- Show some invisible characters (tabs...
opt.confirm = true            -- Confirm to save changes before exiting modified buffer
opt.grepprg = "rg --vimgrep"
opt.mouse = "a"               -- Enable mouse mode
opt.conceallevel = 3          -- Hide * markup for bold and italic
opt.signcolumn = "yes"        -- Always show the signcolumn, otherwise it would shift the text each time
opt.spelllang = { "en" }

-- IFDEF tab and spacing configs
opt.textwidth = 80     -- Wrap after 80 chars
opt.smartindent = true -- Insert indents automatically

-- Will be overwritten by LinuxTabs
opt.tabstop = 4       -- Size of an indent
opt.shiftwidth = 4    -- Size of an indent
opt.softtabstop = 4
opt.expandtab = false -- Convert tabstops to spaces when hitting TAB
--- END

-- ENDIF

o.background = 'dark'
cmd [[ :hi StatusLineNC guibg=NONE ]]
cmd [[ :hi StatusLine guibg=NONE ]]
opt.guicursor = "n-v-c:block-blinkwait250-blinkoff150-blinkon175,i-ci-cr:hor50-blinkoff50-blinkon75"
opt.termguicolors = true -- True color support
opt.showcmd = true
opt.undolevels = 10000
opt.pumblend = 10  -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.shellcmdflag = '-ic'
opt.timeoutlen = 400

-- IFDEF Autocommands
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
-- ENDIF
