# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

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
    alias ll='ls -lGF'
    alias ls='ls -GF'
    PATH=$PATH:/usr/local/homebrew/bin
else
    alias ll='ls -lF --color '
    alias ls='ls -F --color '
fi

alias tmux='tmux -2'


# tmux
#xmodmap -e 'remove lock = Caps_Lock'
#xmodmap -e 'clear Lock'
#xmodmap -e 'keycode 66 = Insert' &> /dev/null
#setxkbmap -layout us


# digital clock
clock() { tmux clock; }
tab()   { tmux break-pane; }
tabc()  { tmux kill-window; }
tabe()  {
    tmux new-window;
    if [[ -n $1 ]]
    then
        tmux rename-window $1;
    fi
}
tabf()  { tmux find-window ${1:?empty}; }
tabn()  { tmux next-window; }
tabo()  {
    while tmux next-window 2>/dev/null
    do
        tmux kill-window
    done
}
tabp()  { tmux previous-window; }
tabs()  { tmux list-window; }
qa()    { tmux kill-session; }
sp()    { tmux split-window; }
vsp()   { tmux split-window -h; }
on()    { tmux kill-pane -a; }
typeset -fx tab{,c,e,f,n,p,s} {,v}sp qa on clock

shopt -s cdspell
#shopt -s globstar
