#!/bin/zsh

if [ -x "`which keychain 2> /dev/null`" ]; then
  keychain --nogui --quiet $HOME/.ssh/id_rsa $HOME/.ssh/id_ecdsa
  if [ -f ~/.keychain/$HOST-sh ]; then
    unset SSH_AUTH_SOCK
    source ~/.keychain/$HOST-sh
  fi
fi
