local telescope = require('telescope')
telescope.setup {
    find_files = {
        hidden = true
    }
}

local builtin = require('telescope.builtin')
vim.api.nvim_set_keymap('n', '<leader>ff',
    "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>"
    , {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
