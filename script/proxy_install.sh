#!/bin/sh
if [ ! -d ~/bin ]; then
    mkdir bin
fi

echo '. ~/bin/proxy_env' >> ~/.bash_profile

cat > ~/bin/proxy_env << 'EOF'
export http_proxy="http://192.168.122.1:3128"
export https_proxy="https://192.168.122.1:3128"
export ftp_proxy="ftp://192.168.122.1:3128"
export no_proxy='.xiaomi.com'
#no_proxy=localhost,127.0.0.0/8,127.0.1.1,127.0.1.1*,local.home,git.n.xiaomi.com
#export no_proxy=myhost_to_ignore,$no_proxy

export GIT_PROXY_COMMAND="${HOME}/bin/git-proxy"
export GIT_PROXY_IGNORE="xiaomi.com"
EOF
chmod 755 ~/bin/proxy_env

#git 
cat > ~/bin/git-proxy << 'EOF'
#!/bin/bash

PROXY=192.168.122.1
PORT=3128

case $1 in
       # list internal git servers here that you do not want to use
       # the proxy with, separated by a pipe character '|' as below: internalgit1.example.com|internalgit2.example.com)
       METHOD="-X connect"
       ;;
*)
       METHOD="-X 5 -x ${PROXY}:${PORT}"
       ;;
esac

nc $METHOD $*
EOF
chmod 755 ~/bin/git-proxy

#git ssh
cat >> ~/.ssh/config << 'EOF'
host github.com
    user git
    hostname github.com
    port 22
    proxycommand socat - PROXY:192.168.122.1:%h:%p,proxyport=3128,proxyauth=user:pwd
EOF
chmod 700 ~/.ssh/config

. ~/bin/proxy_env
