export ZSH=~/.oh-my-zsh

# oh-my-zsh setup
ZSH_THEME="robbyrussell"
plugins=(git go)
source $ZSH/oh-my-zsh.sh

# FZF (this is created by fzf itsef)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Env
export EDITOR=vim
export GOPATH=$HOME/go
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src/github.com
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src
export PATH=$PATH:$HOME/go/bin


# Aliases
alias clipc='xclip -in -selection clipboard'
alias keesync='rclone sync ~/.keepassxc dropbox:/keepass'
alias n='vim'
alias v='vim'
source $HOME/.local.zsh

sslverify() {
  openssl s_client -connect $1
}

sslciphers() {
  nmap --script ssl-enum-ciphers -p 443 $1
}

symaddr() {
  local elf=$1
  local symbol=$2
  local addr=$(objdump -tT $elf | awk -v s=$symbol '$NF==s && $4 == ".text" {print $1}')
  echo 0x$addr
}
