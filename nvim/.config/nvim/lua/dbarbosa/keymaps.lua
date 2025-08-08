local map = vim.keymap.set
local unmap = vim.keymap.del
local set = vim.opt
local defaults = { noremap = true, silent = true }
local loud_default = { noreamp = true, silent = false }

-- Map Leader to "\", but first unmap it
map("n", "\\", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = "\\"

-- Source Current File (for configs)
map('n', '<leader>src', ':so %<CR>', loud_defaults)

-- Tab & Buffer mgmt
map("n", "<leader>b", ":buffers<CR>:buffer<Space>")

-- Reminder: use gt & GT to move through tabs
map("n", "<leader>tn", ":tabnew<CR>")
map("n", "<leader>tm", ":tabmove<CR>")
map("n", "<leader>tc", ":tabclose<CR>")
map("n", "<leader>to", ":tabonly<CR>")

-- Force a write
map("c", ":w!!", ":w !sudo tee > /dev/null %")

-- Open NvimTree
map("n", "<leader>t", "<cmd>:NvimTreeToggle<CR>", { noremap = false, silent = false })

-- Telescope Keybindings
map('n', '<leader>ff', "<cmd>:Telescope find_files<CR>", loud_defaults)
map('n', '<leader>fg', "<cmd>:Telescope live_grep<CR>", loud_defaults)
map('n', '<leader>fb', "<cmd>:Telescope buffers<CR>", loud_defaults)
map('n', '<leader>fh', "<cmd>:Telescope help_tags<CR>", loud_defaults)
map('n', '<leader>fk', "<cmd>:Telescope keymaps<CR>", loud_defaults)
map('n', '<leader>fq', "<cmd>:Telescope quickfix<CR>", loud_defaults)

-- LSP Keybindings
map('n', '<leader>lsps', "<cmd>:LspStop<CR>", loud_defaults)
map('n', '<leader>lspt', "<cmd>:LspStart<CR>", loud_defaults)
map('n', '<leader>lsp', "<cmd>:LspRestart<CR>", loud_defaults)
map('n', '<leader>hl', "<cmd>:TSBufToggle highlight<CR>", loud_defaults)

-- VIEW lua/dbarbosa/configs/mason.lua for more lsp keybinds


-- Map GregKH LinuxStyle
map('n', '<leader>lcs', '<cmd>:LinuxCodingStyle<CR>', defaults)
