#!/bin/zsh

if [ -x `which keychain` ]; then
  keychain $HOME/.ssh/id_rsa $HOME/.ssh/id_dsa
  [ -f ~/.keychain/$HOST-sh ] && source ~/.keychain/$HOST-sh
fi
