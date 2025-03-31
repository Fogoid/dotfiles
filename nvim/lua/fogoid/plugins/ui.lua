return {
    {
        'catppuccin/nvim',
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            transparent_background = false,
            styles = {
                comments = { "italic" },
                functions = { "bold" },
                keywords = { "italic" },
                operators = { "bold" },
                conditionals = { "bold" },
                loops = { "bold" },
                booleans = { "bold", "italic" },
                numbers = {},
                types = {},
                strings = {},
                variables = {},
                properties = {},
            },
            color_overrides = {
                mocha = {
                    base = "#000000",
                    mantle = "#000000",
                    crust = "#000000",
                },
                latte = {
                    base = "#f8eecc",
                    mantle = "#f8eecc",
                    crust = "#f8eecc",
                },
            },
            custom_highlights = {
            }
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
            vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#f5c2e7', bold = true })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            "folke/trouble.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            local trouble = require("trouble")
            local symbols = trouble.statusline({
              mode = "lsp_document_symbols",
              groups = {},
              title = false,
              filter = { range = true },
              format = "{kind_icon}{symbol.name:Normal}",
              -- The following line is needed to fix the background color
              -- Set it to the lualine section you want to use
              hl_group = "lualine_c_normal",
            })

            require('lualine').setup({
                options = {
                    globalstatus = true
                },
                winbar = {
                    lualine_c = {
                        { 'filename', path = 2 },
                        { symbols.get, cond = symbols.has },
                    },
                    --lualine_b = {
                    --    { symbols.get, cond = symbols.has }
                    --},
                }
            })
        end,
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
}
