# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment and startup programs

export PATH=$PATH:$HOME/bin
export LANG="zh_CN.UTF-8"
export PS1='[${debian_chroot:+($debian_chroot)}\u@\h:\w]\$'

alias vi='vim'
alias ff='find . | xargs grep -n --color '
alias ffh='find . -name \*.h -type f| xargs grep -n --color '
alias ffc='find . -name \*.c -o -name \*.cpp -type f| xargs grep -n --color '
alias grep='grep --color '
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias gitd='git difftool'

if [ `uname` == 'Darwin' ]
then
    alias ls='ls -GF'
    alias la='ls -GFa'
    alias ll='ls -lGF'
    PATH=/usr/local/homebrew/bin:$PATH
else
    alias ls='ls -F --color '
    alias la='ls -Fa --color '
    alias ll='ls -Fl --color '
fi

export JAVA_HOME=/usr/lib/jvm/java-1.6.0-openjdk-1.6.0.0.x86_64

#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#. ~/bin/proxy_env
#PATH=/usr/local/maven/bin:$PATH
#. ~/.cloudfoundry_deployment_profile
if [ -f $HOME/.localrc ]; then
    . $HOME/.localrc
fi
