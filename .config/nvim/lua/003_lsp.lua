-- 1. LSP Sever management
require('mason').setup()

require("mason-lspconfig").setup()
require('mason-lspconfig').setup_handlers({ function(server)
    local opt = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        )
    }
    if server == "pylsp" then
        opt.settings = {
            pylsp = {
                plugins = {
                    flake8 = { enabled = true },
                    autopep8 = { enabled = true },
                    mccabe = { enabled = false },
                    pycodestyle = { enabled = false },
                    pyflakes = { enabled = false },
                    pylint = { enabled = true },
                    yapf = { enabled = true }
                }
            }
        }
    end
    if server == "sumneko_lua" then
        opt.settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        'vim',
                        'use',
                        'cmd'
                    }
                },
            }
        }
    end
    local function on_attach(client, _)
        if client.resolved_capabilities.document_highlight then
            vim.cmd [[
            augroup LspHighlight
                autocmd!
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
            ]]
        end
    end

    require('lspconfig')[server].setup(opt, {
        on_attach = on_attach
    })
end })

require("null-ls").setup()
require("mason-null-ls").setup({
    automatic_setup = true,
})

vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
