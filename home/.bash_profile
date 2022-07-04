#!/bin/bash

export LANG='en_US.UTF-8'
export TERM=xterm-color
export PS1='[\u@\h:\w]\$'



function add_path {
	for v in $*; do
		if [[ -e $v && ! ":${PATH}:" =~ ":${v}:" ]]; then
			export PATH=$v:$PATH
		fi
	done
}

function add_classpath {
	for v in $*; do
		if [[ -e $v  && ! ":${CLASSPATH}:" =~ ":${v}:" ]]; then
			export CLASSPATH=$v:$CLASSPATH
		fi
	done
}

function _source {
	for v in $*; do
		if [ -e $v ]; then
			source $v
		fi
	done
}

PATH=""

_source						\
	/etc/profile				\
	/etc/profile.d/bash_completion.sh	\
	/usr/local/etc/bash_completion		\
	${HOME}/.config/git-completion.bash	\
	${HOME}/.config/docker.bash		\
	${HOME}/.cargo/env			\
	$HOME/.rvm/scripts/rvm			\
	${HOME}/.bashrc				\
	${HOME}/.bash_local

add_path					\
	/sbin					\
	/usr/sbin				\
	/usr/local/sbin				\
	${HOME}/.rvm/bin			\
	$HOME/bin

add_classpath					\
	${HOME}/bin/antlr-4.7.1-complete.jar

alias vi='vim'
alias ff='find . -type f| xargs grep -n --color'
alias ffh='find . -name \*.h -type f| xargs grep -n --color'
alias ffc='find . -name \*.c -o -name \*.cpp -type f| xargs grep -n --color'
alias ffgo='find . -name \*.go -type f| xargs grep -n --color'
alias grep='grep --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias gitd='git difftool'
alias xldd='/root/BcmXiaoQiang/external_toolchain/hndtools-arm-linux-2.6.36-uclibc-4.5.3/bin/ldd'
alias xnm='/root/BcmXiaoQiang/external_toolchain/hndtools-arm-linux-2.6.36-uclibc-4.5.3/bin/arm-brcm-linux-uclibcgnueabi-nm'
alias tmux='tmux -2'
alias u='ssh -X yubo@u'
alias shs='python -m SimpleHTTPServer'
alias dstat='dstat -cdlmnpsy'
alias mm='make 2>&1 | more'
alias canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias cgdb="canary --remote-debugging-port=9222 http://localhost:9222 http://chromium.org"
alias golist="go list -f '{{join .Imports \"\n\"}}'"
alias slog="sudo journalctl -u"
alias sstatus="sudo systemctl status"
alias sstart="sudo systemctl start"
alias sstop="sudo systemctl stop"
alias srestart="sudo systemctl restart"
alias sreload="sudo systemctl reload"
alias ccd='cd $(pwd -P)'
alias antlr4='java -Xmx500M -cp "${HOME}/bin/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "${HOME}/bin/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'
alias bfg='java -jar ${HOME}/bin/bfg-1.13.0.jar'
alias gotest='go test -v -args -v 10 -logtostderr true'

if [ "x"$TERM == "xxterm" ]; then
	alias sshx='ssh -X'
fi


# kubectl
if type kubectl >/dev/null 2>&1; then
	export KUBE_EDITOR="vim"
	source <(kubectl completion bash)
	alias k='kubectl'
	complete -F __start_kubectl k
fi

# mac os
if [ `uname` == 'Darwin' ]; then
	alias ls='ls -GF --color'
	alias la='ls -GFa --color'
	alias ll='ls -lGF --color'
	export BASH_SILENCE_DEPRECATION_WARNING=1
else
	alias ls='ls -F --color '
	alias la='ls -Fa --color '
	alias ll='ls -Fl --color '
fi

if [ -f $HOME/.rbenv/bin/rbenv ]; then
	add_path $HOME/.rbenv/bin
	eval "$(rbenv init -)"
fi

if [ -e $HOME/go ]; then
	export GOROOT=$HOME/go
	export GOPATH=$HOME/gopath
	add_path $GOROOT/bin
	add_path $GOPATH/bin
fi

function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch_color="\[\033[31m\]"
    local __git_branch='`git branch --no-color 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/[\1]/"`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"
    export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt


if [ -d ${HOME}/src/dpdk ]; then
	export RTE_SDK=${HOME}/src/dpdk
	export RTE_TARGET=x86_64-native-linuxapp-gcc
fi
