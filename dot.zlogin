#!/bin/zsh

if [ -x "`which keychain 2> /dev/null`" ]; then
  if [ ! -f $HOME/.keychain.locck ]; then
      touch $HOME/.keychain.locck
      keychain --quiet $HOME/.ssh/id_rsa
      [ -f ~/.keychain/$HOST-sh ] && source ~/.keychain/$HOST-sh
      rm -f $HOME/.keychain.locck
  fi
fi
