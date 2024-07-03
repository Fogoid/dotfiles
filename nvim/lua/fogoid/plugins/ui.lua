return {
    {
        'rose-pine/neovim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme rose-pine]])

            vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#f5c2e7', bold = false })
            vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#89dceb', bold = true })
            vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#f5c2e7', bold = false })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                globalstatus = true
            }
        },
    },
    { 'itchyny/vim-cursorword' },
    {
        'gelguy/wilder.nvim',
        opts = {
            modes = { ':', '/', '?' }
        },
        init = function()
            local wilder = require('wilder')
            local gradient = {
                '#aff05b', '#b6e84e', '#bfde43', '#c8d43a', '#d2c934',
                '#dcbe30', '#e6b32e', '#efa72f', '#f89b31', '#ff9036',
                '#ff843d', '#ff7a45', '#ff704e', '#ff6658', '#ff5e63',
                '#ff566f', '#ff507a', '#fd4a85', '#f4468f'
            }

            for i, fg in ipairs(gradient) do
                gradient[i] = wilder.make_hl('WilderGradient' .. i, 'Pmenu',
                    { { a = 1 }, { a = 1 }, { foreground = fg } })
            end

            wilder.set_option('renderer', wilder.popupmenu_renderer({
                highlights = {
                    gradient = gradient, -- must be set
                    -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
                },
                highlighter = wilder.highlighter_with_gradient({
                    wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
                }),
            }))
        end
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function ()
            require("nvim-tree").setup()
        end,
    }
}
