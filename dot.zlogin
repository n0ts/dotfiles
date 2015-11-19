#!/bin/zsh

if [ -x "`which keychain 2> /dev/null`" ]; then
  if [ ! -f $HOME/.keychain.lock ]; then
    touch $HOME/.keychain.lock
    keychain --nogui --quiet $HOME/.ssh/id_rsa
    if [ -f ~/.keychain/$HOST-sh ]; then
      unset SSH_AUTH_SOCK
      source ~/.keychain/$HOST-sh
      rm -f $HOME/.keychain.lock
    fi
  fi
fi
