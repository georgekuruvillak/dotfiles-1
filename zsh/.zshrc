export ZSH=~/.oh-my-zsh

# oh-my-zsh setup
ZSH_THEME="robbyrussell"
plugins=(git go)
source $ZSH/oh-my-zsh.sh

# FZF (this is created by fzf itsef)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Env
export EDITOR=nvim
export GOPATH=$HOME/go
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src/github.com
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src
export PATH=$PATH:$HOME/go/bin


# Aliases
alias clipc='xclip -in -selection clipboard'
alias keesync='rclone sync ~/.keepassxc dropbox:/keepass'
alias vim='nvim'
alias n='nvim'

source $HOME/.local.zsh

# ------------
# Containers!
# ------------

# Azure CLI
function az() {
    docker run --rm -u $(id -u):$(id -g) -v $HOME/.azure:/.azure -it azuresdk/azure-cli-python az $@
}

