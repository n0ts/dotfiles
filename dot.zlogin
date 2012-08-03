#!/bin/zsh

if [ -x "`which keychain 2> /dev/null`" ]; then
  keychain --quiet $HOME/.ssh/id_rsa
  [ -f ~/.keychain/$HOST-sh ] && source ~/.keychain/$HOST-sh
fi
