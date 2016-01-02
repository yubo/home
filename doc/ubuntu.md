## install rbenv
```shell
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
```

## libevent 2.x
```shell
git clone https://github.com/libevent/libevent.git 
cd libevent; git checkout -b release-2.0.22-stable release-2.0.22-stable; ...
```

## tmux
```shell
git clone git://git.code.sf.net/p/tmux/tmux-code tmux
cd tmux; ...
```

## cmake
```shell
wget http://www.cmake.org/files/v3.2/cmake-3.2.1.tar.gz
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

