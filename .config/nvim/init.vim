set number                    "行番号を表示
set autoindent                "改行時に自動でインデントする
set tabstop=4                 "タブを何文字の空白に変換するか
set shiftwidth=4              "自動インデント時に入力する空白の数
set expandtab                 "タブ入力を空白に変換
set smarttab
set autoindent
set nowrap"長い行を折り返さない
set clipboard+=unnamed        "yank した文字列をクリップボードにコピー
set clipboard+=unnamedplus
set hls                       "検索した文字をハイライトする
set smartcase
set incsearch
set showtabline=2             " タブライン出していこうぜ
set ambiwidth=single
let mapleader ="\<Space>"
imap <silent> <F1> <C-R>=strftime("%Y-%m-%d")<CR>
imap <silent> <F2> <C-R>=strftime("%Y-%m-%d (%a)")<CR>

" set termguicolors

set encoding=utf-8
set fileencodings=utf-8
set colorcolumn=65,80
highlight ColorColumn guibg=#002020 ctermbg=23

noremap <Leader>r :source $XDG_CONFIG_HOME/nvim/init.vim<CR>:noh<CR>:echo'reload!'<CR>

"------
" 最後まで飛ぶ
nnoremap <Leader>l $
nnoremap <Leader>h 0
vnoremap <Leader>l $
vnoremap <Leader>h 0

" 折り返し行移動(表示されている行で移動できる)
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nmap <Leader>y byw
nmap <Leader>v bve

" jjでノーマルモードに移動する&保存する
inoremap jj <ESC>
noremap <Leader>w :w<CR>
noremap qq :q<CR>

noremap <Leader>" :%s/\'/\"/g<CR>
noremap <Leader>' :%s/\"/\'/g<CR>
" 検索終わりのハイライトを消す
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

:command! Q q!
:command! W !sudo tee % > /dev/null

"--Undoをできるように
if has('persistent_undo')
  set undodir=/tmp/nvim/undo
  set undofile
endif
let &packpath = &runtimepath
nnoremap <leader><C-i> :tabnext<CR>
nnoremap <leader><leader><C-i> :tabclose<CR>

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal g`\"" | endif
augroup END

let g:python3_host_prog = '/usr/bin/python3'

nmap <F5> :!python3 %<CR>
source ~/.config/nvim/.vim/dein_config.vim
source ~/.config/nvim/.vim/SyntaxInfo.vim

autocmd ColorScheme * highlight Statement ctermfg=11

colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_diff_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
