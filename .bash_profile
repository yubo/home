# .bash_profile 
#
export LANG='en_US.UTF-8'
export PS1='[${debian_chroot:+($debian_chroot)}\u@\h:\w]\$'
export TERM=xterm-color

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi


[ -f /usr/local/homebrew/etc/bash_completion ] && . /usr/local/homebrew/etc/bash_completion

