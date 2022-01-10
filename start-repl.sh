#!/bin/sh
set -xe

SOCKET=$(pwd)/.guile-repl.socket
if [ -e $SOCKET ]; then 
    rm $SOCKET;
fi
guile --listen=$SOCKET
rm $SOCKET
