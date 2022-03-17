export LANG='en_US.UTF-8'
export TERM=xterm-color
export PS1='[\u@\h:\w]\$'



function add_path {
	for path in $*; do
		if [ -f $path ]; then
			CLASSPATH=$path:$PATH
		fi
	done
}

function add_classpath {
	for path in $*; do
		if [ -f $path ]; then
			CLASSPATH=$path:$CLASSPATH
		fi
	done
}

function _source {
	for file in $*; do
		if [ -f $1 ]; then
			source $file
		fi
	done
}

add_path					\
	$HOME/bin				\
	${HOME}/.rvm/bin			\
	/usr/local/homebrew/bin

add_classpath					\
	${HOME}/bin/antlr-4.7.1-complete.jar

_source						\
	/etc/bashrc				\
	/etc/profile.d/bash_completion.sh	\
	/usr/local/homebrew/etc/bash_completion	\
	/usr/local/etc/bash_completion		\
	${HOME}/.config/git-completion.bash	\
	${HOME}/.config/docker.bash		\
	${HOME}/.cargo/env			\
	$HOME/.rvm/scripts/rvm			\
	${HOME}/.bash_rc

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
alias docker-dev='GOPATH=/go:/go/src/github.com/docker/vendor'
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

if [ `uname` == 'Darwin' ]; then
	alias ls='ls -GF'
	alias la='ls -GFa'
	alias ll='ls -lGF'
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


function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1]/"
}

if [ -n $(parse_git_branch) ]; then
	export PS1='\[\e[1;36m\]$(e=$? && [ $e -ne 0 ] && echo "[$e]" )\[\e[0m\][\u@\h:\w]\[\e[1;36m\]$(parse_git_branch)\[\e[0m\]\[\e[1;31m\]${REC}\[\e[0m\]\$'
fi

if [ -d ${HOME}/src/dpdk ]; then
	export RTE_SDK=${HOME}/src/dpdk
	export RTE_TARGET=x86_64-native-linuxapp-gcc
fi
