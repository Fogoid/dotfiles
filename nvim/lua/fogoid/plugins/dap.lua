return {
    {
        "mfussenegger/nvim-dap",
        init = function()
            local dap = require('dap')

            dap.adapters.coreclr = {
                type = 'executable',
                command = 'C:/DevTools/netcoredbg/netcoredbg',
                args = { '--interpreter=vscode' }
            }

            dap.adapters.codelldb = {
                type = 'server',
                port = '${port}',
                executable = {
                    -- CHANGE THIS to your path!
                    command = 'C:/Users/Diogo/.vscode/extensions/vadimcn.vscode-lldb-1.9.2/adapter/codelldb.exe',
                    args = { '--port', '${port}' },

                    -- On windows you may have to uncomment this:
                    detached = false,
                }
            }
        end,
        keys = function ()
            local dap = require('dap')
            vim.keymap.set('n', '<F5>', function() dap.continue() end)
            vim.keymap.set('n', '<F10>', function() dap.step_over() end)
            vim.keymap.set('n', '<F11>', function() dap.step_into() end)
            vim.keymap.set('n', '<F12>', function() dap.step_out() end)
            vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        init = function ()
            local dap = require('dap')
            local dapui = require('dapui')
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    },
    {
        "leoluz/nvim-dap-go",
        dependencies = {
            "mfussenegger/nvim-dap"
        }
    },
    {
        'stevearc/overseer.nvim',
        dependencies = {
            "mfussenegger/nvim-dap"
        },
        init = function ()
            local overseerJson = require('overseer.json')
            local vscExt = require('dap.ext.vscode')

            vscExt.json_decode = overseerJson.decode
            vscExt.load_launchjs(nil, { coreclr = { 'cs' }, codelldb = { 'rust' } })
        end
    }
}
