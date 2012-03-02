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
setopt  HIST_REDUCE_BLANKS    # 
setopt  HIST_IGNORE_SPACE     # 
setopt  IGNORE_EOF            # 
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
setopt  PRINT_EIGHT_BIT       # 
setopt  PROMPT_SUBST          # 
setopt  PUSHD_IGNORE_DUPS     # 
setopt  SHARE_HISTORY         # share history among zshs
setopt  SUN_KEYBOARD_HACK     # 
setopt  ZLE                   # 
unsetopt BG_NICE              # 

# see manual zshparam(1).
HISTSIZE=10000
SAVEHIST=100000
HISTFILE=$HOME/.zhistory

# emacs keybind
bindkey -e
bindkey '^?'    backward-delete-char
bindkey '^H'    backward-delete-char
bindkey '^[[3~' delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# completion style
zstyle ':completion:*:default' menu select=1
hosts=( ${(@)${${(M)${(s:# :)${(zj:# :)${(Lf)"$([[ -f ~/.ssh/config ]] && < ~/.ssh/config)"}%%\#*}}##host(|name) *}#host(|name) }/\*} )
zstyle ':completion:*:hosts' hosts $hosts
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# prompts
if [ "$TERM" != "dumb" ]; then
  PROMPT='%{[$[31+$RANDOM % 6]m%}%B%U%m'"@%n%#%{[m%}%u%b "
  RPROMPT='%{[$[31+$RANDOM % 6]m%}%B%(?.%h.ERROR:%?) (%3c)%{[m%}%b'
fi

SPROMPT='Correct> '\''%r'\'' [Yes No Abort Edit] ? '

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
alias c='clear'
alias cp='nocorrect cp'
alias df='df -h'
alias du='du -h'
alias e='emacs -nw'
alias f=finger
if [  -x "`which hub 2> /dev/null`" ]; then
  alias git=hub
else
  alias git=git
fi
alias g=git
alias grep='grep --color'
alias h=history
alias j=jobs
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='mysql --auto-rehash'
alias p=pushd pp=popd
alias ps='ps auxw'
alias q=exit
alias quit=exit
alias r=rails
alias rm='rm -i'
alias s=screen
alias sd='sudo -H -s'
alias scr='screen -D -RR'
alias sd='sudo -H -s'
alias sudo='sudo -H'
alias sudu=sudo
alias tf='tail -f'
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


export LANG=en_US.UTF-8
export LESSCHARSET=UTF-8
export LESS='-R'
if [ -x "`which nkf 2> /dev/null`" ]; then
    export LESSOPEN='| $HOME/.env/source-highlight/src-hilite-lesspipe.sh %s | nkf'
else
    export LESSOPEN='| $HOME/.env/source-highlight/src-hilite-lesspipe.sh %s'
fi
export WORDCHARS='*?-[]~\!#%^(){}<>|`@#%^*()+:?'
export HOST=`hostname`
export PAGER=less
export OSTYPE=`uname -s`
export LSCOLORS=dxfxcxdxbxegedabagacad
export EDITOR=vi
if [ -x `which emacsclient 2> /dev/null` ]; then
  export EDITOR=emacsclient
fi

ospath=( /usr/{,s}bin /{,s}bin )
localpath=( /opt/*/{,s}bin /usr/local/{,s}bin /usr/X11R6/{,s}bin )
homepath=( $HOME/.bin $HOME/{,s}bin )
path=( $homepath $localpath $ospath )

# autoload
fpath=($HOME/.zfunctions $fpath)
autoload -U compinit; compinit -u
autoload _canonical_paths args preexec
source $HOME/.zfunctions/cdd

# rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# load platform configuration
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

# load local configuration
[ -r $HOME/.zshrc.local ] && source $HOME/.zshrc.local


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
