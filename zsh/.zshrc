export ZSH=~/.oh-my-zsh

if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
fi

# oh-my-zsh setup
ZSH_THEME="robbyrussell"
plugis=(git go colored-man-pages tmux)
source $ZSH/oh-my-zsh.sh

# FZF (this is created by fzf itsef)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# load local zsh settings if present
[ -f ~/.local.zsh ] && source ~/.local.zsh


# Env
export EDITOR=nvim
export GOPATH=$HOME/go
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src/github.com
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export KUBECONFIG=$HOME/.kube/current
export CC=clang
export GPG_TTY=$(tty)

export HYPERVISOR=""
alias clipc='pbcopy'
if [ ! "$(uname)" = "Darwin" ]; then
  export HYPERVISOR=$(dmesg --notime | grep -i hypervisor | cut -d ':' -f2 | tr -d " \t\n\r")
  alias clipc='xclip -in -selection clipboard'
fi

# Locale
export LANG=en_US.UTF-8

# Aliases
alias n='nvim'
alias tmux='tmux -u'

ssl::verify() {
  openssl s_client -connect $1
}

ssl::ciphers() {
  nmap --script ssl-enum-ciphers -p 443 $1
}

symaddr() {
  local elf=$1
  local symbol=$2
  local addr=$(objdump -tT $elf | awk -v s=$symbol '$NF==s && $4 == ".text" {print $1}')
  echo 0x$addr
}

kubeconfig::link() {
  ln -sf $HOME/.kube/$1 $HOME/.kube/current
}

export ETCDCTL_API=3

export WORKPATH=$HOME/Projects


if [ ! -z "$TMUX" ]; then
  if [ "$HYPERVISOR" = "KVM" ]; then
    tmux source-file ~/.config/tmux/vm.conf
  fi
fi
