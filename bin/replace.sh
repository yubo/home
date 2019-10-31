#!/bin/bash
sed -i '.bak' "s/sso\./oauth2./g" *.go  

