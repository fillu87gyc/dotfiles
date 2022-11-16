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
