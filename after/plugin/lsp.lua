local lsp = require('lsp-zero').preset({})
local lspconfig = require('lspconfig')
local omnisharpExt = require('omnisharp_extended')

lsp.preset('recommended')

lsp.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
    
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "<leader>gd", function() omnisharpExt.telescope_lsp_definitions() end, opts) 
    vim.keymap.set("n", "<leader>gref", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  --lsp.default_keymaps({buffer = bufnr})
end)

lspconfig.omnisharp.setup{
    cmd = { "dotnet", "C:/DevTools/Omnisharp/Omnisharp.dll" },

    handlers = {
        ["textDocument/definition"] = omnisharpExt.handler
    },

    enable_roslyn_analyzers = true,

    enable_import_completion = true,

    organize_imports_on_format = true
}

--lspconfig.rust_analyzer.setup{}

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['rust_analyser'] = {'rust'},
        ['omnisharp'] = {'c_sharp'}
    }
})

lsp.setup()
