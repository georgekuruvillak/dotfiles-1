#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(which git)
stow=$(which stow)

if [ ! -d "$install_path" ]; then
  $git clone https://github.com/fntlnz/dotfiles $install_path
fi

pushd $install_path
$stow i3
$stow nvim
$stow dunst
$stow tmux
$stow git
$stow gdb
$stow pam
$stow systemd
$stow zsh
$stow screenlayout
popd

