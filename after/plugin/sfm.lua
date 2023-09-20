local sfm = require('sfm')

sfm.setup({
    mappings = {
        custom_only = true,
        list = {
            {
                key = "<CR>",
                action = "edit",
            },
            {
                key = "l",
                action = "edit",
            },
            {
                key = "<C-v>",
                action = "vsplit",
            },
            {
                key = "<C-h>",
                action = "split",
            },
            {
                key = "<C-t>",
                action = "tabnew",
            },
            {
                key = "<S-TAB>",
                action = "close_entry",
            },
            {
                key = "h",
                action = "close_entry",
            },
            {
                key = "J",
                action = "last_sibling",
            },
            {
                key = "K",
                action = "first_sibling",
            },
            {
                key = "P",
                action = "parent_entry",
            },
            {
                key = "<C-]>",
                action = "change_root_to_parent",
            },
            {
                key = "]",
                action = "change_root_to_entry",
            },
            {
                key = "R",
                action = "reload",
            },
            {
                key = "q",
                action = "close",
            },
            {
                key = "n",
                action = "create",
            },
            {
                key = "dd",
                action = "delete",
            },
            {
                key = "ds",
                action = "delete_selections",
            },
            {
                key = "c",
                action = "copy",
            },
            {
                key = "p",
                action = "copy_selections",
            },
            {
                key = "x",
                action = "move_selections",
            },
            {
                key = "r",
                action = "move",
            },
        }
    }
})

vim.keymap.set('n', '<leader>fe', '<cmd>SFMToggle<CR>')
