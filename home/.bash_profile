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

export PATH="/bin:/usr/bin:/usr/local/bin"

_source						\
	/etc/profile				\
	/etc/profile.d/bash_completion.sh	\
	/usr/local/etc/bash_completion		\
	${HOME}/.config/git-completion.bash	\
	${HOME}/.config/docker.bash		\
	${HOME}/.cargo/env			\
	$HOME/.rvm/scripts/rvm			\
	${HOME}/.bashrc

add_path					\
	/sbin					\
	/usr/sbin				\
	/usr/local/sbin				\
	${HOME}/.rvm/bin			\
	$HOME/bin


alias vi='vim'
alias ff='find . -type f| xargs grep -n --color'
alias ffh='find . -name \*.h -type f| xargs grep -n --color'
alias ffc='find . -name \*.c -o -name \*.cpp -type f| xargs grep -n --color'
alias ffgo='find . -name \*.go -type f| xargs grep -n --color'
alias grep='grep --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias tmux='tmux -2'
alias ta='tmux -2 new -As'
alias shs='python -m SimpleHTTPServer'
alias dstat='dstat -cdlmnpsy'
alias mm='make 2>&1 | more'
alias ccd='cd $(pwd -P)'

if [ "x"$TERM == "xxterm" ]; then
	alias sshx='ssh -X'
fi

# mac os
if [ `uname` == 'Darwin' ]; then
	alias ls='ls -GF --color'
	alias la='ls -GFa --color'
	alias ll='ls -lGF --color'
	export BASH_SILENCE_DEPRECATION_WARNING=1
	alias canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
	alias cgdb="canary --remote-debugging-port=9222 http://localhost:9222 http://chromium.org"
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

# kubectl
command -v kubectl >/dev/null 2>&1 && {
	export KUBE_EDITOR="vim"
	source <(kubectl completion bash)
	alias k='kubectl'
	complete -F __start_kubectl k
}

command -v java >/dev/null 2>&1 && {
	alias antlr4='java -Xmx500M -cp "${HOME}/bin/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
	alias grun='java -Xmx500M -cp "${HOME}/bin/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'
	alias bfg='java -jar ${HOME}/bin/bfg-1.13.0.jar'

	add_classpath					\
		${HOME}/bin/antlr-4.7.1-complete.jar
}

command -v go >/dev/null 2>&1 && {
	alias golist="go list -f '{{join .Imports \"\n\"}}'"
	alias gotest='go test -v -args -v 10 -logtostderr true'
}

command -v systemctl >/dev/null 2>&1 && {
	alias sstatus="sudo systemctl status"
	alias sstart="sudo systemctl start"
	alias sstop="sudo systemctl stop"
	alias srestart="sudo systemctl restart"
	alias sreload="sudo systemctl reload"
	alias slog="sudo journalctl -u"
}

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
