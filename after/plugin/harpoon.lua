local harpoon = require('harpoon')

harpoon:setup()

vim.keymap.set('n', '<leader>wn', function() harpoon:list():next() end)
vim.keymap.set('n', '<leader>wp', function() harpoon:list():prev() end)
vim.keymap.set('n', '<leader>wa', function() harpoon:list():append() end)
vim.keymap.set('n', '<leader>wt', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
