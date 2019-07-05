# .bash_profile 
#
export LANG='en_US.UTF-8'
export PS1='[${debian_chroot:+($debian_chroot)}\u@\h:\w]\$'
export TERM=xterm-color

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


if [ -f /usr/local/homebrew/etc/bash_completion ]; then
	. /usr/local/homebrew/etc/bash_completion
elif [ -f /usr/local/etc/bash_completion ]; then
	. /usr/local/etc/bash_completion
fi

if [ -f "$HOME/.rvm/scripts/rvm" ]; then
	source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
fi
