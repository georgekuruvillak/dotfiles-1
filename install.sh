#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(command -v git)
stow=$(command -v stow)
curl=$(command -v curl)

if [ ! -d "$install_path" ]; then
  $git clone https://github.com/fntlnz/dotfiles "$install_path"
fi

pushd "$install_path"

$stow home
$stow nvim
$stow zsh
$stow tmux
$stow git
$stow gdb
$stow gnupg
$stow alacritty
popd

