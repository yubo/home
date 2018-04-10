## golang install

```
mkdir ~/src && cd ~/src
wget https://storage.googleapis.com/golang/go1.4-bootstrap-20170531.tar.gz
tar xzvf ./go1.4-bootstrap-20170531.tar.gz
cd go/src
CGO_ENABLED=0 bash make.bash
cd
git clone https://github.com/golang/go
cd go
git checkout -b go1.9.5 go1.9.5
cd src
GOROOT_BOOTSTRAP=~/src/go ./all.bash
```
