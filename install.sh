#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

if [ ! -d "$install_path" ]; then
  git clone https://github.com/fntlnz/dotfiles "$install_path"
fi

source $install_path/scripts/func.sh

stow=$(check stow)
curl=$(check curl)

check_os

pushd "$install_path"
$stow home
$stow nvim
$stow zsh
$stow tmux
$stow git
$stow gdb
$stow gnupg
setup_gnupg
setup_pinentry
$stow alacritty
popd

