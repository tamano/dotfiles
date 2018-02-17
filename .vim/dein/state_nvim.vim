if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/tamano/dotfiles/nvim/init.vim', '/Users/tamano/dotfiles/.vim/dein/plugins.toml', '/Users/tamano/dotfiles/.vim/dein/lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/tamano/dotfiles/.vim/dein'
let g:dein#_runtime_path = '/Users/tamano/dotfiles/.vim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/Users/tamano/dotfiles/.vim/dein/.cache/init.vim'
let &runtimepath = '/Users/tamano/dotfiles/nvim,/etc/xdg/nvim,/Users/tamano/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/Users/tamano/dotfiles/.vim/dein/repos/github.com/Shougo/dein.vim,/Users/tamano/dotfiles/.vim/dein/.cache/init.vim/.dein,/usr/local/Cellar/neovim/0.2.2_1/share/nvim/runtime,/Users/tamano/dotfiles/.vim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/Users/tamano/.local/share/nvim/site/after,/etc/xdg/nvim/after,/Users/tamano/dotfiles/nvim/after'
filetype off
