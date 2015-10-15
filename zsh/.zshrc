export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git svn composer pip docker python docker-compose)

source $ZSH/oh-my-zsh.sh

# GO
export GOPATH=$HOME/go

# ANSIBLE
export ANSIBLE_HOSTS=$HOME/.ansible_hosts

# SVN
export SVN_EDITOR=vim

# Editor
export EDITOR=nvim

# Locale
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# User configuration
export PATH="$PATH:$HOME/.composer/vendor/bin:/usr/local/go:$GOPATH/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin"

# .zshrc_local
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

# History ignore space
setopt HIST_IGNORE_SPACE

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_TMUX=0
