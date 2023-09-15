local bufferline = require('bufferline')

bufferline.setup {
    options = {
        mode = 'tabs',
        indicator = {
            style = 'underline'
        },
        --show_buffer_icons = false,
        --show_close_icon = false,
        show_buffer_close_icons = false,
        middle_mouse_command = "bdelete! %d",
        separator_style = 'slope',
    }
}

vim.keymap.set('n', '<C-n>', '<cmd>BufferLineCycleNext<CR>')
vim.keymap.set('n', '<C-p>', '<cmd>BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<C-k>p', '<cmd>BufferLineTogglePin<CR>')

