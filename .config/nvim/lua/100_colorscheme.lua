-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  gui=underline guifg=#E5E9F0 guibg=#4C566A
highlight LspReferenceRead  gui=underline guifg=#A0A000 guibg=#104040
highlight LspReferenceWrite gui=underline guifg=#A0A000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]

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
    source ~/.config/nvim/.vim/SyntaxInfo.vim
    autocmd ColorScheme * highlight Statement ctermfg=11
    let g:nord_cursor_line_number_background = 1
    let g:nord_uniform_diff_background = 1
    let g:nord_italic = 1
    let g:nord_italic_comments = 1
    let g:nord_underline = 1
    colorscheme nord
]]
