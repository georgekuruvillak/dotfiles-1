export ZSH=/home/fntlnz/.oh-my-zsh

# oh-my-zsh setup
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# FZF (this is created by fzf itsef)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Env
export LC_ALL="en_US.UTF-8"
export GOPATH=$HOME/go
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src/git.kiratech.it
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src/github.com
export PATH=$PATH:$HOME/go/bin

# Aliases
alias clipc='xclip -in -selection clipboard'
alias keesync='rclone sync ~/.keepass dropbox:/keepass'

