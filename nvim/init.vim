" dein.vimによるプラグイン管理
if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('~/dotfiles/.vim/dein')

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    call dein#load_toml(s:dein_dir . '/plugins.toml', {'lazy': 0})
    call dein#load_toml(s:dein_dir . '/lazy.toml', {'lazy': 1})

    call dein#end()
    call dein#save_state()
endif

source ~/.vimrc

colorscheme tender
let g:lightline = { 'colorscheme': 'tender' }

