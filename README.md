# HOME
My working development environment configuration, including bash, tmux, vim, git, ssh, etc.

## install
```shell
git clone git@github.com:yubo/home.git ~/.yubo
cd ~/.yubo && sh install.sh
vim
:PlugInstall
:q
```

## local config
- bash `~/.bashrc`
- ssh config `~/.ssh/conf.d/*`
	```
	Host {aliasname}
	  HostName {ip/hostname}
	  Port 8222
	  User {user}
	  IdentityFile ~/.ssh/id_rsa.example.com
	```
- git config

## bash

map   | desc
--    | --
C-a a | move to the start of the command line
C-e   | move to the end of the command line
C-p   | pre
C-n   | next
C-b   | backward
C-f   | forward
C-u   | delete forward
C-k   | delete backward

## tmux

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

#### SEE ALSO
  * [ubuntu](docs/ubuntu.md)
  * [centos](docs/centos.md)
  * [osx](docs/osx.md)
  * [nvim](docs/nvim.md)
  * [shell](docs/shell.md)
  * [tmux](docs/tmux.md)
