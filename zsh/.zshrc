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

# User configuration
export PATH="$PATH:$HOME/.composer/vendor/bin:$GOPATH/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# Tmux alias 256 colors
alias tmux="tmux -2"
if [[ ! $TERM =~ screen ]]; then
    exec tmux -2
fi

# Hide gvim warnings
alias gvim="gvim 2>/dev/null"
