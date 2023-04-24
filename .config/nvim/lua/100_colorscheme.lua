vim.cmd [[
    :command! Q q!
    set clipboard+=unnamed
    set clipboard+=unnamedplus

    if has('persistent_undo')
    set undodir=/tmp/nvim/undo
    set undofile
    endif
    augroup vimrcEx
    au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "normal g`\"" | endif
    augroup END
    let g:python3_host_prog = '/usr/bin/python3'

    nmap <F5> :!python3 %<CR>
    source ~/.config/nvim/SyntaxInfo.vim
    autocmd ColorScheme * highlight Statement ctermfg=11
    let g:nord_italic = 1
    let g:nord_italic_comments = 1
    let g:nord_underline = 1
    colorscheme nord
]]
