# tmux tips
tmux默认键改为 ctrl-a

### build from source
```shell
mkdir -p -m 0700 ~/.tmux.tmp
cd ~/.tmux.tmp

wget https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
wget https://ftp.gnu.org/gnu/ncurses/ncurses-6.0.tar.gz
wget https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz

tar -xzf libevent-2.0.22-stable.tar.gz
cd ~/.tmux.tmp/libevent-2.0.22-stable

./configure --prefix="$HOME/local"
make
make install

tar -xzf ncurses-6.0.tar.gz
cd ~/.tmux.tmp/ncurses-6.0

./configure --prefix="$HOME/local"
make
make install

export CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses"
export LDFLAGS="-L$HOME/local/lib"

tar -xzf tmux-2.0.tar.gz
cd ~/.tmux.tmp/tmux-2.0

./configure --prefix="$HOME/local"
make
make install

cd ~/local/bin
```

### session
```
bind $ #修改当前会话名称(session name)
bind d #退出当前会话
tmux ls #列出会话
tmux a[ttach] -t session_name #进入session_name
```


### window
```
bind , #修改tmux window name
bind c #create window
bind n #next window
bind p #pre window
bind N #swap next window
bind P #swap pre window
bind - #split window
bind | #vsplit window
bind z #zoom window
```
