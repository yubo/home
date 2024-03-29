## Centos Environment initialization

```shell
#dev
sudo yum update
sudo yum install clang clang-analyzer java make gcc-c++ gcc-gfortran gcc compat-gcc-44-c++ \
compat-gcc-44-gfortran compat-libf2c-34 gdb cmake git tig git-svn curl-devel expat-devel \
gettext-devel openssl-devel zlib-devel gcc perl-ExtUtils-MakeMaker nodejs npm wget \
python-devel bind-utils git-lfs

#vim
sudo yum install tmux indent ctags vim

#kernel dev
sudo yum install rpm-build redhat-rpm-config asciidoc hmaccalc perl-ExtUtils-Embed pesign xmlto 
sudo yum install audit-libs-devel binutils-devel elfutils-devel elfutils-libelf-devel
sudo yum install ncurses-devel newt-devel numactl-devel pciutils-devel python-devel zlib-devel
sudo yum install net-tools bc openssl bison gettext
```

#### rbenv
```
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
```


#### gcc-12.3.0.tar.xz

```
cd gcc-12.3.0
sudo yum install libmpc-devel gmp
./configure --enable-checking=release --enable-languages=c,c++ --disable-multilib
sudo make install
```

#### cmake-3.26.3.tar.gz

```
cd cmake-3.26.3
./configure
make
sudo make install
```
