# .bash_profile 
#
export LANG="zh_CN.UTF-8"
export PS1='[${debian_chroot:+($debian_chroot)}\u@\h:\w]\$'
export TERM=xterm-color

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

