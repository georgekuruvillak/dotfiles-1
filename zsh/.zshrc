export ZSH=~/.oh-my-zsh

# oh-my-zsh setup
ZSH_THEME="robbyrussell"
plugins=(git go ssh-agent)
source $ZSH/oh-my-zsh.sh

# FZF (this is created by fzf itsef)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Env
export EDITOR=nvim
export LC_ALL=""
export GOPATH=$HOME/go
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src/github.com
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src
export PATH=$PATH:$HOME/go/bin


# Aliases
alias clipc='xclip -in -selection clipboard'
alias keesync='rclone sync ~/.keepass dropbox:/keepass'

# Azure CLI
function az() { 
    docker run --rm -u $(id -u):$(id -g) -v $HOME/.azure:/.azure -it azuresdk/azure-cli-python az $@
}

