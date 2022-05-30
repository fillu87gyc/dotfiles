if &compatible
  set nocompatible               " Be iMproved
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein_ddc.toml', {'lazy': 1})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  " Required:
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

