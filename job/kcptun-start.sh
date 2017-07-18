#!/usr/bin/env bash

#shadowsocks
nohup ../assets/bins/server_linux_386 -t 127.0.0.1:443 -l :3999 -mode fast2 &

#xshell
nohup ../assets/bins/server_linux_386 -t 127.0.0.1:1024 -l :8000 -mode fast2 &
