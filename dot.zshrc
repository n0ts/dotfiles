#!/bin/zsh

# see manual umask
umask 022

# core dump size
limit coredumpsize 0

# see manual zshoptions(1)
setopt  ALWAYS_TO_END         # 
setopt  AUTO_CD               # 
setopt  AUTO_PUSHD            # 
setopt  AUTO_RESUME           # 
setopt  BANG_HIST             # 
#setopt  CDABLE_VARS           # 
setopt  COMPLETE_IN_WORD      # 
#setopt CORRECT                # 
setopt  CORRECT_ALL           # 
setopt  CSH_JUNKIE_HISTORY    # 
setopt  EQUALS                # 
setopt  EXTENDED_GLOB         # 
setopt  EXTENDED_HISTORY      # 
setopt  FUNCTION_ARGZERO      # 
#setopt  GLOB_COMPLETE         # 
setopt  GLOB_DOTS             # 
setopt  HIST_IGNORE_ALL_DUPS  # ignore duplication command history list
setopt  HIST_IGNORE_DUPS      # 
setopt  HIST_IGNORE_SPACE     # 
setopt  HIST_NO_STORE         # 
setopt  HIST_REDUCE_BLANKS    # 
setopt  IGNORE_EOF            # 
setopt  INC_APPEND_HISTORY    # 
setopt  INTERACTIVE_COMMENTS  # 
setopt  LIST_PACKED           # 
setopt  LONG_LIST_JOBS        # 
setopt  MAGIC_EQUAL_SUBST     # 
setopt  NO_BEEP               # 
setopt  NO_CLOBBER            # 
setopt  NO_FLOW_CONTROL       # 
setopt  NO_HUP                # 
setopt  NO_LIST_BEEP          # 
setopt  NONOMATCH             # 
setopt  NOTIFY                # 
setopt  NUMERIC_GLOB_SORT     # 
setopt  PATH_DIRS             # 
setopt  PRINT_EIGHT_BIT       # 
setopt  PROMPT_SUBST          # 
setopt  PUSHD_IGNORE_DUPS     # 
setopt  SHARE_HISTORY         # share history among zshs
setopt  SUN_KEYBOARD_HACK     # 
setopt  ZLE                   # 
unsetopt BG_NICE              # 

# see manual zshparam(1).
HISTSIZE=20000
SAVEHIST=200000
HISTFILE=$HOME/.zhistory
function history-all { history -E 1 }

# path
[ -d $HOME/.zsh-completions ] && fpath=($HOME/.zsh-completions $fpath)
fpath=($HOME/.zfunctions $fpath)
ospath=( /usr/{,s}bin /{,s}bin )
localpath=( /opt/*/{,s}bin /usr/local/{,s}bin /usr/X11R6/{,s}bin )
homepath=( $HOME/.{,s}bin )
path=( $homepath $localpath $ospath )

# load platform configuration
export OSTYPE=`uname -s`
case $OSTYPE in
  Linux*)
    [ -r $HOME/.zshrc.linux ] && source $HOME/.zshrc.linux
  ;;
  FreeBSD*)
    [ -r $HOME/.zshrc.freebsd ] && source $HOME/.zshrc.freebsd
  ;;
  Darwin*)
    [ -r $HOME/.zshrc.darwin ] && source $HOME/.zshrc.darwin
  ;;
esac

# environment variable configuration
export LANG=en_US.UTF-8
export LESSCHARSET=UTF-8
export LESS='-R'
if [ -x "`which source-highlight 2> /dev/null`" ]; then
  if [ -x "`which nkf 2> /dev/null`" ]; then
    export LESSOPEN='| $HOME/.env/source-highlight/src-hilite-lesspipe.sh %s | nkf'
  else
    export LESSOPEN='| $HOME/.env/source-highlight/src-hilite-lesspipe.sh %s'
  fi
fi
export WORDCHARS='*?-[]~\!#%^(){}<>|`@#%^*()+:?'
export HOST=`hostname`
export PAGER=less
export LSCOLORS=dxfxcxdxbxegedabagacad
if [ -x "`which emacsclient 2> /dev/null`" ]; then
  export EDITOR=emacsclient
else
  export EDITOR=vi
fi

# emacs keybind
bindkey -e
bindkey '^?'    backward-delete-char
bindkey '^H'    backward-delete-char
bindkey '^[[3~' delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# history keybinf
autoload -Uz is-at-least
if is-at-least 4.3.10; then
  bindkey '^R' history-incremental-pattern-search-backward
  bindkey '^S' history-incremental-pattern-search-forward
fi

# turn on auto-completion
autoload -U compinit; compinit -u;
autoload -U zstyle+
autoload _canonical_paths args preexec
source $HOME/.zfunctions/cdd

# completion style
zstyle ':completion:*' menu select
zstyle ':completion:*' format '%F{white}%d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
  _approximate _list _history

# completion cache on
zstyle ':completion:*' use-cache true

# menu
zstyle ':completion:*:default' menu select=1

# case-insensitive (uppercase from lowercase) completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# mosh
compdef mosh=ssh

# ssh completion
hosts=( ${(@)${${(M)${(s:# :)${(zj:# :)${(Lf)"$([[ -f $HOME/.ssh/config ]] && < $HOME/.ssh/config)"}%%\#*}}##host(|name) *}#host(|name) }/\*} )
zstyle ':completion:*:hosts' hosts $hosts

# colors on completion
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}

case $OSTYPE in
  Linux*)
    PS_CMD="ps -axco pid,user,command"
  ;;
  FreeBSD*)
    PS_CMD="ps -xco pid,user,command"
  ;;
  Darwin*)
    PS_CMD="ps -axco pid,user,command"
  ;;
esac

zstyle ':completion:*:processes' command $PS_CMD
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

# sudo completion
zstyle -e ":completion:*:sudo:*" command-path 'reply=($path)'

# prompt
if [ "$TERM" != "dumb" ]; then
  PROMPT1='%{[$[31+$RANDOM % 6]m%}%B%U%m'"@%n%#%{[m%}%u%b "
  PROMPT2='%{[$[31+$RANDOM % 6]m%}%B%(?.%h.ERROR:%?) (%3c)%{[m%}%b'
  PROMPT="${PROMPT2}
${PROMPT1}"
fi
SPROMPT="%{[31m%}'%r' is correct? [n,y,a,e] %{${reset_color}%}"


# aliases
if gls --color > /dev/null 2>&1; then
  alias ls='gls --color=auto -F'
elif ls --color > /dev/null 2>&1; then
  alias ls='ls --color=auto -F'
elif ls -G > /dev/null 2>&1; then
  alias ls='ls -FG'
else
  alias ls='ls -F'
fi
alias la='ls -AFlh'
alias ll='ls -Flh'
alias l=ls
alias sl=l

alias ack='nocorrect ack'
alias be='bundle exec'
alias c='clear'
alias cp='nocorrect cp'
alias df='df -h'
alias du='du -h'
alias e='emacs -nw'
alias f=finger
if [  -x "`which hub 2> /dev/null`" ]; then
  alias git=hub
fi
alias g=git
alias grep='grep --color'
alias h=history
alias less='less --tabs=4'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='mysql --auto-rehash'
alias p=pushd pp=popd
alias ps='ps auxw'
alias q=exit
alias quit=exit
alias r=rails
alias rm='rm -i'
alias ra=rake
alias rs=rspec
alias s=screen
alias sd='sudo -H -s'
alias sr='screen -D -RR'
alias sd='sudo -H -s'
alias sudo='sudo -H'
alias sudu=sudo
alias tf='tail -f'
if [ -x "`which vim 2> /dev/null`" ]; then
  alias v='vim'
else
  alias v='vi'
fi
alias x=exit

alias -s zip=zipinfo
alias -s tgz=gzcat
alias -s gz=gzcat
alias -s tbz=bzcat
alias -s bz2=bzcat
alias -s java=lv
alias -s c=lv
alias -s h=lv
alias -s C=lv
alias -s cpp=lv
alias -s conf=lv
alias -s txt=lv
alias -s xml=lv

alias -g psg="$PS_CMD | grep"
alias -g lsg='ls | grep'


# dabbrev
HARDCOPYFILE=$HOME/.screen-hardcopy
touch $HARDCOPYFILE

dabbrev-complete () {
  local reply lines=80 # 80 lines
  screen -X eval "hardcopy -h $HARDCOPYFILE"
  reply=($(sed '/^$/d' $HARDCOPYFILE | sed '$ d' | tail -$lines))
  compadd - "${reply[@]%[*/=@|]}"
}

zle -C dabbrev-complete menu-complete dabbrev-complete
bindkey '^o' dabbrev-complete
bindkey '^o^_' reverse-menu-complete


# auto-fu.zsh
if [ -f $HOME/.auto-fo.zsh/auto-fu.zsh ]; then
  # zsh version 4.3 or later
  if [[ $ZSH_VERSION == 4.<3->* || $ZSH_VERSION == <5->* ]]; then
    source $HOME/.auto-fo.zsh/auto-fu.zsh
    zle-line-init () {
      auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':auto-fu:highlight' input bold
    zstyle ':auto-fu:highlight' completion fg=white
    zstyle ':auto-fu:var' postdisplay ''
    zstyle ':completion:*' completer _oldlist _complete
  fi
fi


# zaw.zsh
if [ -f $HOME/.zaw/zaw.zsh ]; then
  source $HOME/.zaw/zaw.zsh
  # local local zaw sources
  local local_src_dir="$HOME/.zaw.sources/" f
  if [[ -d "${local_src_dir}" ]]; then
    for f ("${local_src_dir}"/*) source "${f}"
  fi

  bindkey '^R' zaw-history
  bindkey '^U' zaw-cdd
fi


# edit-file
edit-file() {
  zle -I
  local file
  local -a words

  words=(${(z)LBUFFER})
  file="${words[$#words]}"
  [[ -f "$file" ]] && $EDITOR "$file"
}
zle -N edit-file
bindkey "^x^f" edit-file


# git
function git() {
  if ! (( $+_has_working_hub ))
  then
    hub --version &> /dev/null
    _has_working_hub=$(($? == 0))
  fi
  if (( $_has_working_hub ))
  then
    hub "$@"
  else
    command git "$@"
  fi
}


# past command-line
pbcopy-buffer() { 
  print -rn $BUFFER | pbcopy
  zle -M "pbcopy: ${BUFFER}"
}

zle -N pbcopy-buffer
bindkey '^x^p' pbcopy-buffer


# cpanm
PERL_CPANM_LOCAL_LIB=$HOME/.perl-extlib
export PERL_CPANM_OPT="--local-lib=$PERL_CPANM_LOCAL_LIB"
if [ -d $PERL_CPANM_LOCAL_LIB ]; then
  export PERL5LIB="$PERL_CPANM_LOCAL_LIB/lib/perl5"
  path=( $PERL_CPANM_LOCAL_LIB/bin $path )
fi


# nvm
[[ -s $HOME/.nvm/nvm.sh ]] && source $HOME/.nvm/nvm.sh


# rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm


# load local configuration
[ -r $HOME/.zshrc.local ] && source $HOME/.zshrc.local


# uniquify my $PATH
typeset -U path cdpath fpath manpath

