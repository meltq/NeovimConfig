local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
local lspconfig = require("lspconfig")
local lsp_signature = require('lsp_signature')

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        lsp_signature.on_attach({
            bind = true,
            handler_opts = {
                border = "rounded"
            },
        }, bufnr)
        on_attach(client, bufnr)
    end,
    capabilities = capabilities,
}

lspconfig.asm_lsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.pylsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'E501' },
                }
            }
        }
    }
})

lsp_signature.setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded"
    }
})
