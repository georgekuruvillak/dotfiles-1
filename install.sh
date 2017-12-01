#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(which git)
stow=$(which stow)

if [ ! -d "$install_path" ]; then
  $git clone https://github.com/fntlnz/dotfiles $install_path
fi

curl -L -o gdb/.gdbinit https://git.io/.gdbinit

pushd $install_path
$stow nvim
$stow tmux
$stow git
$stow gdb
$stow zsh
$stow gnupg
$stow i3
$stow dunst
$stow pam
$stow systemd
popd
