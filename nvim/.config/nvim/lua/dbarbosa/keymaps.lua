local map = vim.keymap.set
local set = vim.opt
local defaults = {noremap = true, silent = true}

-- Map Leader to "\", but first unmap it
map("n", "\\", "<Nop>", {silent = true, remap = false})
vim.g.mapleader = "\\"

-- Tab & Buffer mgmt
map("n", "<leader>b", ":buffers<CR>:buffer<Space>")

map("n", "<leader>tn", ":tabnew<CR>")
map("n", "<leader>tm", ":tabmove<CR>")
map("n", "<leader>tc", ":tabclose<CR>")
map("n", "<leader>to", ":tabonly<CR>")

-- Force a write
map("c", ":w!!", ":w !sudo tee > /dev/null %")

