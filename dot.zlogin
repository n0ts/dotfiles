#!/bin/zsh

if [ -x "`which keychain 2> /dev/null`" ]; then
  keychain --nogui --quiet $HOME/.ssh/id_rsa* $HOME/.ssh/id_ed25519*
  if [ -f ~/.keychain/$HOST-sh ]; then
    unset SSH_AUTH_SOCK
    source ~/.keychain/$HOST-sh
  fi
fi
