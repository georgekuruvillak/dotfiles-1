export ZSH=/usr/share/oh-my-zsh

if [[ -z "$ZSH_CACHE_DIR" ]]; then
  ZSH_CACHE_DIR="$HOME/.cache/oh-my-zsh"
fi

# oh-my-zsh setup
ZSH_THEME="robbyrussell"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
plugins=(git go colored-man-pages nvm zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# FZF (this is created by fzf itsef)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Env
export EDITOR=nvim
export GOPATH=$HOME/go
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src/github.com
export CDPATH=$CDPATH:$HOME/Projects:$GOPATH/src
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.cargo/bin
export KUBECONFIG=$HOME/.kube/current
export CC=clang

# Aliases
alias clipc='xclip -in -selection clipboard'
alias n='nvim'
source $HOME/.local.zsh

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

minienv::start() {
  minikube start --memory 6000 --disk-size 80g --cpus 4 --dns-domain=gallifrey.local
}

minienv::eval() {
  eval $(minikube docker-env)
}

kubeconfig::link() {
  ln -sf $HOME/.kube/$1.conf $HOME/.kube/current
  if [ -n "$TMUX" ]; then
    tmux source-file ~/.tmux.conf
  fi
}

export ETCDCTL_API=3

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/fntlnz/Projects/gb-studio/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/fntlnz/Projects/gb-studio/node_modules/tabtab/.completions/electron-forge.zsh