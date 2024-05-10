local opt = vim.opt

opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.list = true -- Show some invisible characters (tabs...
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.grepprg = "rg --vimgrep"
opt.mouse = "a" -- Enable mouse mode
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }

-- IFDEF tab and spacing configs
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.expandtab = true -- Convert tabstops to spaces when hitting TAB 
opt.textwidth = 80 -- Wrap after 80 chars
-- ENDIF

opt.guicursor = "n-v-c:block-blinkwait250-blinkoff150-blinkon175,i-ci-cr:hor50-blinkoff50-blinkon75"
opt.termguicolors = true -- True color support
opt.showcmd = true
opt.undolevels = 10000
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.shellcmdflag = '-ic'
opt.timeoutlen=400
