#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(which git)
stow=$(which stow)
curl=$(which curl)

if [ ! -d "$install_path" ]; then
  $git clone https://github.com/fntlnz/dotfiles $install_path
fi

pushd $install_path
$curl -L -o gdb/.gdbinit https://git.io/.gdbinit
$stow nvim
$stow tmux
$stow git
$stow gdb
$stow gnupg
$stow i3
$stow dunst
$stow pam
$stow systemd
$stow fish
popd
