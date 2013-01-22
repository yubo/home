#!/bin/bash
export HTTP_PROXY=192.168.122.1:3128
export http_proxy=$HTTP_PROXY

export HTTPS_PROXY=192.168.122.1:3128
export https_proxy=$HTTPS_PROXY

export GIT_SSH="${HOME}/bin/socks-ssh.sh"
export GIT_PROXY_COMMAND="${HOME}/bin/socks-gw.sh"
