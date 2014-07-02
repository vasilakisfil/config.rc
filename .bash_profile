#!/bin/bash

export JAVA_HOME=/usr/java/jdk1.7.0_11/
export PATH=$PATH:/usr/java/jdk1.7.0_11/bin/

export TERM="xterm-256color"


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR="/home/vasilakisfil/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm