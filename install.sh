#!/bin/sh
#git clone git@github.com:yubo/home.git ~/.yubo


install_file()
{
	src=`pwd`"/"$1
	des="$HOME/$1"
	if [ -e $des ]; then
		mv -f $des $des".bak"
	fi
	rm -f $des
	ln -s $src $des
}

if [ ! -d ~/.ssh ]; then
	mkdir ~/.ssh
	chmod 0600 ~/.ssh
fi

install_file bin
install_file .vimrc
install_file .gvimrc
install_file .vim
install_file .bash_profile
install_file .bashrc
install_file .dircolors
install_file .gitconfig
install_file .fonts
install_file .tmux.conf
install_file .git-completion.bash
install_file .ssh/config

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


if [ -f src/connect.c ]; then
    gcc -o bin/connect src/connect.c
fi

if [ ! -e $HOME/gopath ]; then
    mkdir -p $HOME/gopath
fi


source ~/.bashrc
