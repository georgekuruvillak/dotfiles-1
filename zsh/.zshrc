export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git svn composer pip docker python)

source $ZSH/oh-my-zsh.sh

# GO
export GOPATH=$HOME/go

# ANSIBLE
export ANSIBLE_HOSTS=$HOME/.ansible_hosts

# SVN
export SVN_EDITOR=vim

# Editor
export EDITOR=vim

# Locale
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# User configuration
export PATH="$PATH:$HOME/.composer/vendor/bin:/usr/local/go:$GOPATH/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin"

# .zshrc_local
source $HOME/.zshrc_local

# Aliases
alias xclip='xclip -selection c'
alias tmux="tmux -2"
