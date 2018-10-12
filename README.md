# how to install

## dotfiles
```
cd ~
git clone git@github.com:tamano/dotfiles.git
dotfiles/etc/install.sh
```

## dein.vim

```
cd /tmp/
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/dotfiles/.vim/dein
```

start Nvim and put command below

```
:call dein#install()
```
