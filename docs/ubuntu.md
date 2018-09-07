## install rbenv
```shell
#vim
sudo apt-get install tmux indent ctags

#dev
sudo apt-get install git-core build-essential libssl-dev libncurses5-dev unzip cmake global

#kernel dev
sudo apt-get build-dep linux-image-$(uname -r)
sudo apt-get install git-core libncurses5 libncurses5-dev libelf-dev asciidoc binutils-dev

#rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
```

## [golang](golang.md)

## ycm
```shell
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --go-completer
```

