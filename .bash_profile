# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
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

