# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/root/program/dsnat

export PATH

export LANG="zh_CN.UTF-8"
alias vi='vim'
alias grep='grep --color'
alias ff='find . | xargs grep -n --color '
alias ffh='find . -name \*.h -type f| xargs grep -n --color '
alias ffc='find . -name \*.c -o -name \*.cpp -type f| xargs grep -n --color '
