## install rbenv
```shell
#vim
sudo apt-get install tmux indent ctags

#dev
sudo apt-get build-dep
sudo apt-get install git-core build-essential libssl-dev libncurses5-dev unzip cmake

#kernel dev
sudo apt-get build-dep linux-image-$(uname -r)
sudo apt-get install git-core libncurses5 libncurses5-dev libelf-dev asciidoc binutils-dev

#rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
```

## global 
```shell
wget http://tamacom.com/global/global-6.4.tar.gz
```

## vim7.3+
```shell
wget http://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
locate python | grep '/config$'
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib64/python2.6/config \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-gui=gtk2
```

## ycm
```shell
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
```

## golang
```shell
cd
mkdir gopath
git clone https://github.com/golang/go
cd go
git checkout go1.4.1
cd src
./all.bash
```

