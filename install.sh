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

install_file bin
install_file .vimrc
install_file .vim
install_file .bash_profile
install_file .bashrc
install_file .dircolors
install_file .gitconfig
install_file .fonts
install_file .tmux.conf
install_file .git-completion.bash

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle


if [ -f src/connect.c ]; then
    gcc -o bin/connect src/connect.c
fi

if [ ! -e $HOME/go/bin ]; then
    mkdir -p $HOME/go/bin
fi



