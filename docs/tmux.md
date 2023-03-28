# tmux tips
tmux默认键改为 ctrl-a

### install
```shell
# ubuntu & debian
apt install tmux

# centos
yum install tmux

# darwin
brew install tmux
```


### session
```
#列出会话
tmux ls

# 创建会话
tmux new -s <session_name>

# 加入会话
tmux a[ttach] -t session_name

# create a new named session and attach to it if one exists
tmux new -As <session_name>
```

map    | desc
--     | --
c-a $ | 修改当前会话名称(session name)
c-a d | 退出当前会话


### window

map   | desc
--    | --
c-a , | 修改tmux window name
c-a c | create window
c-a n | next window
c-a p | pre window
c-a N | swap next window
c-a P | swap pre window
c-a - | split window
c-a | | vsplit window
c-a z | zoom window
