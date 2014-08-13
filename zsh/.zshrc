export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git svn)

source $ZSH/oh-my-zsh.sh

# Xclip
alias xclip="xclip -selection clipboard"

# GOPATH
export GOPATH=$HOME/go

# GOROOT
export GOROOT=/usr/local/go

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
export PATH="$PATH:$HOME/.composer/vendor/bin:$GOPATH/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/sbin:/usr/local/bin"
# Tmux alias 256 colors
alias tmux="tmux -2"

# Docker host
export DOCKER_HOST=tcp://172.16.42.43:4243
