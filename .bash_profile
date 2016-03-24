# .bash_profile 
#
export LANG="us_EN.UTF-8"
export PS1='[${debian_chroot:+($debian_chroot)}\u@\h:\w]\$'
export TERM=xterm-color

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

