return {
    { 'nvim-lua/plenary.nvim', name = 'plenary' },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
           'nvim-lua/plenary.nvim'
       }

    },
    { 'nvim-treesitter/nvim-treesitter' },
    {
        'mbbill/undotree',
        init = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },

    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = {
           'plenary'
        },
        config = function ()
            require('harpoon'):setup()
        end,
        init = function ()
            local harpoon = require('harpoon')
            vim.keymap.set('n', '<leader>wn', function() harpoon:list():next() end)
            vim.keymap.set('n', '<leader>wp', function() harpoon:list():prev() end)
            vim.keymap.set('n', '<leader>wa', function() harpoon:list():append() end)
            vim.keymap.set('n', '<leader>wt', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        end
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            -- LSP Support
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            -- Autocomplete
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        }
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap"
        }
    },
    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap"
        }
    },
    { 'stevearc/overseer.nvim' }
}
