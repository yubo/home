#!/bin/bash
#git clone git@github.com:yubo/home.git ~/.yubo

bak_dir="$HOME/.home_bak"
pwd_dir=$(pwd)

install_file()
{
	src="${pwd_dir}/home/$1"
	dst="$HOME/$1"
	if [[ -e $dst || -L $dst ]]; then
		mv $dst "${bak_dir}/"
	fi
	ln -s $src $dst
}

if [[ ! -d ~/.ssh ]]; then
	mkdir ~/.ssh
	chmod 0700 ~/.ssh
fi

if [[ ! -d ~/.ssh/conf.d ]]; then
	mkdir -p ~/.ssh/conf.d
fi

if [[ ! -e ~/.bash_local ]]; then
	touch ~/.bash_local
	chmod 0644 ~/.bash_local
fi

if [[ ! -e ~/.vim_local ]]; then
	touch ~/.vim_local
	chmod 0644 ~/.vim_local
fi

if [[ -d "$bak_dir" ]]; then
	tmp_dir=$(mktemp -d -t home-XXXXXXXXXX)
	mv $bak_dir $tmp_dir
	echo "move last bak to $tmp_dir"
fi
mkdir -p $bak_dir

install_file bin
install_file .bash_profile
install_file .bashrc
install_file .bash_docker
install_file .dircolors
install_file .fonts
install_file .gdbinit
install_file .git-completion.bash
install_file .gvimrc
install_file .globalrc
install_file .gitconfig
install_file .ssh/config
install_file .tmux.conf
install_file .vimrc
install_file .vim
install_file .mpdconf
#install_file .kermrc 

if [[ ! -d ~/.vim/bundle/vundle ]]; then
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
else
	echo "~/.vim/bundle/vundle already exists, skip clone"
fi

if [[ -f misc/connect.c ]]; then
    gcc -o bin/connect misc/connect.c
fi

if [[ ! -e $HOME/gopath ]]; then
    mkdir -p $HOME/gopath
fi
