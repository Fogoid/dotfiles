local dap = require('dap')
local dapui = require('dapui')
local vscExt = require('dap.ext.vscode')
local overseer = require('overseer')
local overseerJson = require('overseer.json')

dap.adapters.coreclr = {
    type = 'executable',
    command = 'C:/DevTools/netcoredbg/netcoredbg',
    args = {'--interpreter=vscode'}
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
vscExt.json_decode = overseerJson.decode
vscExt.load_launchjs(nil, { coreclr = { 'cs' } })

-- keymaps
vim.keymap.set('n', '<F5>', function() dap.continue() end)
vim.keymap.set('n', '<F10>', function() dap.step_over() end)
vim.keymap.set('n', '<F11>', function() dap.step_into() end)
vim.keymap.set('n', '<F12>', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)


--dap-ui config
dapui.setup({})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

overseer.setup({})
