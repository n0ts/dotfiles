Naoya Nakazawa's dotfiles. dotfiles for emacs, zsh, mysql, top, git etc...

* Support OS
  - OSX Lion 10.7 or later
  - Linux (mostly works in CentOS/SL 5 or later / Ubuntu 11 or later)
  - FreeBSD 8.x or later

* Installation
  $ git clone https://github.com/n0ts/dotfiles $HOME/.env
  $ cd .env
  $ make

** auto-fu.zsh
  $ git clone https://github.com/hchbaw/auto-fu.zsh.git $HOME/.auto-fo.zsh

** zaw
  $ git clone https://github.com/zsh-users/zaw.git $HOME/.zaw

** zsh-completion
  $ git clone https://github.com/zsh-users/zsh-completions.git $HOME/.zsh-completions

** rbenv
  $ brew install rbenv ruby-build
  $ export RUBY_CONFIGURE_OPTS="--with-readline-dir=`brew --prefix readline` --with-openssl-dir=`brew --prefix openssl`"
  $ rbenv install ree-1.8.7-2012.02
  $ rbenv install 1.9.3-p448
  $ rbenv install 2.0.0-p247
  $ rbenv rehash
  $ rbenv global 2.0.0-p247
  $ ruby --version
  ruby 2.0.0p247 (2013-06-27 revision 41674) [x86_64-darwin12.4.0]
  $ ruby -rrbconfig -e 'c=Config::CONFIG;c.keys.sort.each{|k|puts "#{k}: #{c[k]}"}'

** plenv
  $ brew install plenv perl-build
  $ plenv install 5.18.0
  $ plenv reash
  $ plenv global 5.18.0
  $ perl --version
  This is perl 5, version 18, subversion 0 (v5.18.0) built for darwin-2level
  ...
  $ plenv install-cpanm

