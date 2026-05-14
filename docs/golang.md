## Go 安装

### macOS

```sh
brew install go
```

### Linux / 手动安装

从 [golang.org/dl](https://golang.org/dl) 下载对应平台的压缩包：

```sh
# 以 go1.23 linux/amd64 为例
wget https://go.dev/dl/go1.23.0.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.23.0.linux-amd64.tar.gz
```

然后在 `~/.bash_profile` 中设置：

```sh
export GOROOT=/usr/local/go
export GOPATH=$HOME/gopath
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
```
