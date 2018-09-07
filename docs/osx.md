##Prepare Install
```shell
#install xcode from app store
curl -LsSf http://github.com/mxcl/homebrew/tarball/master | sudo tar xvz -C/usr/local --strip 1
sudo brew install vim tmux git cmake global 
```

##Install Golang
```shell
cd
sudo brew install --cross-compile-all go
GOROOT_BOOTSTRAP=/usr/local/Cellar/go/1.6.1/libexec/
git clone https://github.com/golang/go
cd go
git checkout -b go1.6 go1.6
cd src
./all.bash
```

##Install [home](../README.md)
```shell
git clone git@github.com:yubo/home.git ~/.yubo
cd ~/.yubo && sh install.sh
fc-cache -vf ~/.fonts
vim
:BundleInstall
:q
```

##Install YCM
```shell
cd ~/.vim/bundle/YouCompleteMe
./install.py  --clang-completer --gocode-completer
```

