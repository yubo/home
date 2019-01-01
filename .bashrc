# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

add_path()
{
	if [ -d $1 ]; then
		PATH=$1:$PATH
	fi
}

alias vi='vim'
alias ff='find . -type f| xargs grep -n --color '
alias ffh='find . -name \*.h -type f| xargs grep -n --color '
alias ffc='find . -name \*.c -o -name \*.cpp -type f| xargs grep -n --color '
alias ffgo='find . -name \*.go -type f| xargs grep -n --color '
alias grep='grep --color '
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
alias slog="sudo journalctl -u "
alias sstatus="sudo systemctl status "
alias sstart="sudo systemctl start "
alias sstop="sudo systemctl stop "
alias srestart="sudo systemctl restart "
alias sreload="sudo systemctl reload "

if [ `uname` == 'Darwin' ]; then
    alias ls='ls -GF'
    alias la='ls -GFa'
    alias ll='ls -lGF'
    add_path /usr/local/homebrew/bin
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
	export PS1='\[\e[1;36m\]$(e=$? && [ $e -ne 0 ] && echo "[$e]" )\[\e[0m\][${debian_chroot:+($debian_chroot)}\u@\h:\w]\[\e[1;36m\]$(parse_git_branch)\[\e[0m\]\[\e[1;31m\]${REC}\[\e[0m\]\$'
fi

if [ -f $HOME/.git-completion.bash ]; then
	source $HOME/.git-completion.bash
fi

alias si='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Source\ Insight\ 3/Insight3.exe'

add_path ~/Android/Sdk/tools
add_path ~/Android/android-ndk-r10d
add_path ~/Android/Sdk/platform-tools
add_path ~/xq/bin/brcm4709/sdk_package/toolchain/bin
add_path /opt/android/android-studio/bin
add_path $HOME/bin
add_path /usr/local/eclipse
add_path /usr/games

if [ "x"$TERM == "xxterm" ]; then
	alias sshx='ssh -X'
fi

if [ -f ~/.bash_local ]; then
	. ~/.bash_local
fi

if [ -f ~/.bash_docker ]; then
	. ~/.bash_docker
fi

if [ -d ~/src/dpdk ]; then
	export RTE_SDK=~/src/dpdk
	export RTE_TARGET=x86_64-native-linuxapp-gcc
fi
