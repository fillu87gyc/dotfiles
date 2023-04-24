-- 1. LSP Sever management
-- local null_ls = require "null-ls"
-- null_ls.setup {
--     sources = {
--         null_ls.builtins.formatting.prettier.with {
--             prefer_local = "node_modules/.bin",
--         },
--     },
-- }
--
-- require("mason-null-ls").setup({
--     automatic_setup = true,
-- })
vim.cmd [[
    set updatetime=300
    highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
    highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
    highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
]]

require('mason').setup()
require("mason-lspconfig").setup()
require('mason-lspconfig').setup_handlers({ function(server)
    local opt = {
        on_attach = function(client, bufnr)
            -- keymap setting ...
            vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
            vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                callback = vim.lsp.buf.document_highlight,
                buffer = bufnr,
                group = "lsp_document_highlight",
                desc = "Document Highlight",
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                callback = vim.lsp.buf.clear_references,
                buffer = bufnr,
                group = "lsp_document_highlight",
                desc = "Clear All the References",
            })
        end,
        capabilities = require('cmp_nvim_lsp').default_capabilities(
            vim.lsp.protocol.make_client_capabilities()
        ),
    }
    if server == "pylsp" then
        opt.settings = {
            pylsp = {
                plugins = {
                    flake8 = { enabled = false },
                    autopep8 = { enabled = false },
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
    require('lspconfig')[server].setup(opt)
end })

vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.format()'
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
