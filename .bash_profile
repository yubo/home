# .bash_profile 
#
export PATH=$PATH:$HOME/bin:/usr/local/eclipse
export PATH=$HOME/bin:/root/BcmXiaoQiang/external_toolchain/arm-xiaomi-linux-uclibcgnueabi/bin:$PATH
export LANG="zh_CN.UTF-8"
export PS1='[${debian_chroot:+($debian_chroot)}\u@\h:\w]\$'
export TERM=xterm-color

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

