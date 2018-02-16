#!/bin/zsh

# see manual umask
umask 022

# core dump size
limit coredumpsize 0

# see manual zshoptions(1)
setopt ALWAYS_TO_END        # If unset, key functions that list completions try to return to the last prompt if given a numeric argument. If set these functions try to return to the last prompt if given no numeric argument.
setopt AUTO_CD              # If a command is issued that can’t be executed as a normal command, and the command is the name of a directory, perform the cd command to that directory.
setopt AUTO_PUSHD           # Make cd push the old directory onto the directory stack.
setopt AUTO_RESUME          # Treat single word simple commands without redirection as candidates for resumption of an existing job.
setopt BANG_HIST            # Perform textual history expansion, csh-style, treating the character ‘!’ specially.
setopt CDABLE_VARS          # If the argument to a cd command (or an implied cd with the AUTO_CD option set) is not a directory, and does not begin with a slash, try to expand the expression as if it were preceded by a ‘~’.
setopt COMPLETE_IN_WORD     # If unset, the cursor is set to the end of the word if completion is started. Otherwise it stays there and completion is done from both ends.
setopt CORRECT              # Try to correct the spelling of commands. Note that, when the HASH_LIST_ALL option is not set or when some directories in the path are not readable, this may falsely report spelling errors the first time some commands are used.
setopt CORRECT_ALL          # Try to correct the spelling of all arguments in a line.
setopt CSH_JUNKIE_HISTORY   # A history reference without an event specifier will always refer to the previous command. Without this option, such a history reference refers to the same event as the previous history reference, defaulting to the previous command.
setopt EQUALS               # Perform = filename expansion
setopt EXTENDED_GLOB        # Treat the ‘#’, ‘~’ and ‘^’ characters as part of patterns for filename generation, etc.
setopt EXTENDED_HISTORY     # Save each command’s beginning timestamp (in seconds since the epoch) and the duration (in seconds) to the history file.
setopt FUNCTION_ARGZERO     # When executing a shell function or sourcing a script, set $0 temporarily to the name of the function/script. Note that toggling FUNCTION_ARGZERO from on to off (or off to on) does not change the current value of $0. Only the state upon entry to the function or script has an effect. Compare POSIX_ARGZERO.
setopt GLOB_COMPLETE        # When the current word has a glob pattern, do not insert all the words resulting from the expansion but generate matches as for completion and cycle through them like MENU_COMPLETE.
setopt GLOB_DOTS            # Do not require a leading ‘.’ in a filename to be matched explicitly.
setopt HIST_IGNORE_ALL_DUPS # If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event).
setopt HIST_IGNORE_DUPS     # Do not enter command lines into the history list if they are duplicates of the previous event.
setopt HIST_IGNORE_SPACE    # Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space. Only normal aliases (not global or suffix aliases) have this behaviour. Note that the command lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the line. If you want to make it vanish right away without entering another command, type a space and press return.
setopt HIST_NO_STORE        # Remove the history (fc -l) command from the history list when invoked. Note that the command lingers in the internal history until the next command is entered before it vanishes, allowing you to briefly reuse or edit the line.
setopt HIST_REDUCE_BLANKS   # Remove superfluous blanks from each command line being added to the history list.
setopt HIST_VERIFY          # Whenever the user enters a line with history expansion, don’t execute the line directly; instead, perform history expansion and reload the line into the editing buffer.
setopt IGNORE_EOF           # Do not exit on end-of-file. Require the use of exit or logout instead. However, ten consecutive EOFs will cause the shell to exit anyway, to avoid the shell hanging if its tty goes away.
setopt INC_APPEND_HISTORY   # This options works like APPEND_HISTORY except that new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits. The file will still be periodically re-written to trim it when the number of lines grows 20% beyond the value specified by $SAVEHIST (see also the HIST_SAVE_BY_COPY option).
setopt INTERACTIVE_COMMENTS # Allow comments even in interactive shells.
setopt LIST_PACKED          # Try to make the completion list smaller (occupying less lines) by printing the matches in columns with different widths.
setopt LONG_LIST_JOBS       # List jobs in the long format by default.
setopt MAGIC_EQUAL_SUBST    # All unquoted arguments of the form ‘anything=expression’ appearing after the command name have filename expansion (that is, where expression has a leading ‘~’ or ‘=’) performed on expression as if it were a parameter assignment. The argument is not otherwise treated specially; it is passed to the command as a single argument, and not used as an actual parameter assignment. For example, in echo foo=~/bar:~/rod, both occurrences of ~ would be replaced. Note that this happens anyway with typeset and similar statements.
setopt NO_BEEP              # 
setopt NO_CLOBBER           # 
setopt NO_FLOW_CONTROL      # 
setopt NO_HUP               # 
setopt NO_LIST_BEEP         # 
setopt NONOMATCH            # 
setopt NOTIFY               # Report the status of background jobs immediately, rather than waiting until just before printing a prompt.
setopt NUMERIC_GLOB_SORT    # If numeric filenames are matched by a filename generation pattern, sort the filenames numerically rather than lexicographically.
setopt PATH_DIRS            # Perform a path search even on command names with slashes in them. Thus if ‘/usr/local/bin’ is in the user’s path, and he or she types ‘X11/xinit’, the command ‘/usr/local/bin/X11/xinit’ will be executed (assuming it exists). Commands explicitly beginning with ‘/’, ‘./’ or ‘../’ are not subject to the path search. This also applies to the ‘.’ and source builtins.
setopt PRINT_EIGHT_BIT      # Print eight bit characters literally in completion lists, etc. This option is not necessary if your system correctly returns the printability of eight bit characters (see man page ctype(3)).
setopt PROMPT_SUBST         # If set, parameter expansion, command substitution and arithmetic expansion are performed in prompts. Substitutions within prompts do not affect the command status.
setopt PUSHD_IGNORE_DUPS    # Don’t push multiple copies of the same directory onto the directory stack.
setopt SHARE_HISTORY        # This option both imports new commands from the history file, and also causes your typed commands to be appended to the history file (the latter is like specifying INC_APPEND_HISTORY, which should be turned off if this option is in effect). The history lines are also output with timestamps ala EXTENDED_HISTORY (which makes it easier to find the spot where we left off reading the file after it gets re-written).
setopt SUN_KEYBOARD_HACK    # If a line ends with a backquote, and there are an odd number of backquotes on the line, ignore the trailing backquote. This is useful on some keyboards where the return key is too small, and the backquote key lies annoyingly close to it. As an alternative the variable KEYBOARD_HACK lets you choose the character to be removed.
setopt ZLE                  # Use the zsh line editor. Set by default in interactive shells connected to a terminal.
unsetopt BG_NICE            # Run all background jobs at a lower priority. This option is set by default.

# see manual zshparam(1).
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=$HOME/.zhistory
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }
function history-all { history -E 1 }

# path
[ -d $HOME/.zsh-completions ] && fpath=($HOME/.zsh-completions/src $fpath)

fpath=($HOME/.zfunctions $fpath)
ospath=( /usr/{,s}bin /{,s}bin )
localpath=( /opt/*/{,s}bin /usr/local/{,s}bin /usr/local/*/{,s}bin /usr/X11R6/{,s}bin )
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
export LC_ALL=$LANG
export LESSCHARSET=UTF-8
export LESS='-R'
if [ -x "`which source-highlight 2> /dev/null`" ]; then
  if [ -x "`which nkf 2> /dev/null`" ]; then
    export LESSOPEN='| src-hilite-lesspipe.sh %s | nkf'
  else
    export LESSOPEN='| src-hilite-lesspipe.sh %s'
  fi
fi
export WORDCHARS='*?-[]~\!#%^(){}<>|`@#%^*()+:?'
export HOST=`hostname`
if [ -x "`which lv 2> /dev/null`" ]; then
export PAGER="lv -c"
else
export PAGER=less
fi
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
autoload _canonical_paths args
[ -f $HOME/.zfunctions/cdd ] && source $HOME/.zfunctions/cdd
[ -f $HOME/.zfunctions/preexec ] && source $HOME/.zfunctions/preexec

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
  if [ -n "${SSH_CLIENT}${SSH_CONNECTION}" ]; then
    PROMPT1="%{[37m%}${HOST%%.*} ${PROMPT1}"
  fi

  PROMPT="${PROMPT2}
${PROMPT1}"
fi
SPROMPT="%{[31m%}'%r' is correct? [n,y,a,e] %{${reset_color}%}"

# aliases
if gls --color > /dev/null 2>&1; then
  alias ls='gls --color=always -F'
elif ls --color > /dev/null 2>&1; then
  alias ls='ls --color=always -F'
elif ls -G > /dev/null 2>&1; then
  alias ls='ls -FG'
else
  alias ls='ls -F'
fi
alias la='ls -AFlh'
alias ll='ls -Flh'
alias l=ls
alias sl=l

alias ag='ag --color'
alias be='bundle exec'
alias bi='bundle install --path .bundle'
alias bc='bundle clean'
alias bo='bundle outdated'
alias bs='bundle show'
alias bu='bundle update'
alias bundle='nocorrect bundle'
alias c='clear'
alias cp='nocorrect cp'
alias df='df -h'
alias du='du -h'
alias e='emacs -nw'
alias egrep='egrep --color'
alias f=finger
if [ -x "`which hub 2> /dev/null`" ]; then
  alias git=hub
fi
alias g=git
alias grep='grep --color=always'
alias h=history
alias less='less --tabs=4'
alias lv='lv -c'
alias m='mosh'
alias man='LANG=C man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'
alias mysql='mysql --auto-rehash --pager="less -S -n -i -F -X"'
alias p=pushd pp=popd
alias ps='ps auxw'
alias q=exit
alias quit=exit
alias r=rails
alias rm='rm -i'
alias ra=rake
alias rs='bundle exec rspec spec'
alias s=screen
alias sd='sudo -H -s'
alias sr='screen -D -RR'
alias sd='sudo -H -s'
alias sudo='sudo -H'
alias sudu=sudo
alias t=tmux
alias tl='tmux ls'
alias tf='tail -f'
alias mux=tmuxinator
if [ -x "`which vagrant 2> /dev/null`" ]; then
  alias vu='vagrant up'
  alias vd='vagrant destroy'
  alias vdf='vagrant destroy -f'
  alias vs='vagrant status'
  alias vssh='vagrant ssh'
  alias vsshc='vagrant ssh-config'
fi
if [ -x "`which vim 2> /dev/null`" ]; then
  alias v='vim'
else
  alias v='vi'
fi
alias x=exit
alias watch='watch -n 1 -dc'

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

dabbrev-complete() {
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

# dircolors
[ -f ~/.dircolors-solarized/dircolors.256dark ] && eval `dircolors ~/.dircolors-solarized/dircolors.256dark 2&> /dev/null`

# direnv
[ -x "`which direnv 2> /dev/null`" ] && eval "$(direnv hook zsh)"

# anyenv
[ -n "$ANYENV_ROOT" ] && eval "$(anyenv init -)"

# source
if [ -d $HOME/.zsh.sources ]; then
  for f (~/.zsh.sources/*) source "${f}"
fi

# load local configuration
[ -r $HOME/.zshrc.local ] && source $HOME/.zshrc.local

# uniquify my $PATH
typeset -U path cdpath fpath manpath

# zcompile
[ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ] && zcompile ~/.zshrc
[ ! -f ~/.zshrc.local.zwc -o ~/.zshrc.local -nt ~/.zshrc.local.zwc ] && zcompile ~/.zshrc.local

# for screen
[ -n "$STY" ] && source ~/.zlogin

# zprof
if exists zprof; then
  zprof | less
fi
