## Ubuntu Environment initialization

```shell
sudo apt install tmux indent ctags
```

#### dev
```shell
sudo apt install git-core build-essential libssl-dev libncurses5-dev unzip cmake global python2.7-dev gettext golang
```

#### kernel dev
https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel

```shell
sudo apt-get build-dep linux-image-$(uname -r)
sudo apt-get install git-core libncurses5 libncurses5-dev libelf-dev asciidoc binutils-dev
sudo apt-get install linux-headers-$(uname -r)
```
