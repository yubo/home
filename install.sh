#!/bin/sh
#git clone git@github.com:yubo/home.git ~/.yubo


install_file()
{
	src=`pwd`"/"$1
	des="$HOME/$1"
	if [ -f $des -o -d $des ]; then
		mv -f $des $des".backup"
	fi
	ln -s $src $des
}

install_file bin
install_file .vimrc
install_file .vim
install_file .bash_profile
install_file .bashrc
install_file .dircolors
install_file .gitconfig

git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle






