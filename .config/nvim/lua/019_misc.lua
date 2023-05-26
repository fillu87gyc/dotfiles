require('Comment').setup({
    toggler = {
        ---Line-comment toggle keymap
        line = '<Leader>c',
        ---Block-comment toggle keymap
        block = '<Leader>C',
    },
    opleader = {
        ---Line-comment keymap
        line = '<Leader>c',
        ---Block-comment keymap
        block = '<Leader>C',
    },
})

require("nvim-surround").setup({
    -- Configuration here, or leave empty to use defaults
})


vim.cmd [[
let g:dps_dial#augends#register#i = [ 'case' ]
nmap cc "i<Plug>(dps-dial-increment)
]]
