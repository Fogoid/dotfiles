return {
    { 'nvim-lua/plenary.nvim', name = 'plenary' },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        init = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end)
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "query", "rust", "c_sharp", "java" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
            'plenary'
        },
        config = function()
            require('harpoon'):setup()
        end,
        init = function()
            local harpoon = require('harpoon')
            vim.keymap.set('n', '<leader>wn', function() harpoon:list():next() end)
            vim.keymap.set('n', '<leader>wp', function() harpoon:list():prev() end)
            vim.keymap.set('n', '<leader>wa', function() harpoon:list():append() end)
            vim.keymap.set('n', '<leader>wt', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        end
    },

}
