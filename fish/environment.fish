alias tmux="tmux -2"
set -xg GOPATH $HOME/go
set -xg EDITOR nvim
set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8
set -xg FZF_TMUX 0
set -xg FZF_DEFAULT_COMMAND 'ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
set -xg PATH /usr/local/bin $PATH /usr/local/go $GOPATH/bin /usr/sbin /usr/bin /sbin /bin

function fish_greeting
  set_color $fish_color_param
  echo "Friendship is magic"
end

function textrec -d "Opens a netcat server on port 2000 so that you can send text to this computer"
  nc -l 2000
end
