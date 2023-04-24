require("bufferline").setup {
    options = {
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = ''
    },
    vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {}),
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
}
