#!/bin/bash
ssh -o ProxyCommand="${HOME}/bin/socks-gw.sh %h %p" $@
