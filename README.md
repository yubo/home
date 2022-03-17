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

## 使用
- 本地的bash配置文件 ~/.bashrc
- 本地的ssh配置文件 `~/.ssh/conf.d/*`
	```
	Host {aliasname}
	  HostName {ip/hostname}
	  Port 8222
	  User {user}
	  IdentityFile ~/.ssh/id_rsa.example.com
	```

#### SEE ALSO
  * [ubuntu](docs/ubuntu.md)
  * [centos](docs/centos.md)
  * [osx](docs/osx.md)
  * [vim](docs/vim.md)
  * [shell](docs/shell.md)
  * [tmux](docs/tmux.md)
