vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.background = "dark"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"

--dap mappings
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>ws', '<cmd>split<CR>')
vim.keymap.set('n', '<Leader>wv', '<cmd>vsplit<CR>')
vim.keymap.set('n', '<Leader>ww', '<cmd>w<CR>')
vim.keymap.set('n', '<Leader>wq', '<cmd>q<CR>')

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.keymap.set('n', '<Leader>pv', function()
    local ft = require('nvim-tree.api')
    if ft.tree.is_visible() and ft.tree.is_tree_buf() then
      ft.tree.close()
    else
      ft.tree.open()
    end
end)

