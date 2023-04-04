#!/bin/bash
#git clone git@github.com:yubo/home.git ~/.yubo

bak_dir="$HOME/.home_bak"
pwd_dir=$(pwd)


function install_dir {
	if [[ ! -d $1 ]]; then
		mkdir -p $1
	fi
	if [[ -n $2 ]]; then
		chmod $2 $1
	fi
}


function install_file {
	src="${pwd_dir}/home/$1"
	dst="$HOME/$1"
	if [[ -e $dst || -L $dst ]]; then
		mv $dst "${bak_dir}/"
	fi
	ln -s $src $dst
}

function ignore_file {
	src="${pwd_dir}/home/$1"
	if [[ -e $src ]]; then
		git update-index --assume-unchanged $src
	fi
}


if [[ -d "$bak_dir" ]]; then
	tmp_dir=$(mktemp -d -t home-XXXXXXXXXX)
	mv $bak_dir $tmp_dir
	echo "move last bak to $tmp_dir"
fi


install_dir $bak_dir
install_dir ~/.ssh 0700
install_dir ~/.ssh/conf.d
install_dir ~/.config
install_dir ~/gopath


install_file bin
install_file .bash_profile
install_file .dircolors
install_file .fonts
install_file .gdbinit
install_file .gvimrc
install_file .globalrc
install_file .gitconfig
install_file .ssh/config 0600
install_file .tmux.conf
install_file .vimrc
install_file .curlrc
install_file .vim

ignore_file .gitconfig
ignore_file .ssh/config
