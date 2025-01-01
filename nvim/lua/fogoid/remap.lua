vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

--mappings
vim.keymap.set('n', '<Leader>h', '<cmd>split<CR>')
vim.keymap.set('n', '<Leader>v', '<cmd>vsplit<CR>')
vim.keymap.set('n', '<Leader>w', '<cmd>w!<CR>')
vim.keymap.set('n', '<Leader>q', '<cmd>q!<CR>')

vim.keymap.set('n', '<Leader>pv', '<CMD>Oil<CR>')

