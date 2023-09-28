local harpoon_ui = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')

vim.keymap.set('n', '<leader>wn', function() harpoon_ui.nav_next() end)
vim.keymap.set('n', '<leader>wp', function() harpoon_ui.nav_prev() end)
vim.keymap.set('n', '<leader>wa', function() harpoon_mark.add_file() end)
vim.keymap.set('n', '<leader>wt', function() harpoon_ui.toggle_quick_menu() end)
