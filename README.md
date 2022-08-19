# how to install

## requirement
- install [homebrew](https://brew.sh/index).

## dotfiles
```sh
cd ~
git clone git@github.com:tamano/dotfiles.git
sh dotfiles/setup.sh
```

## dein.vim

```sh
cd /tmp/
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/dotfiles/.vim/dein
```

start `nvim` and put command below

```vim
:call dein#install()
```
