#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(which git)
stow=$(which stow)
curl=$(which curl)
code=$(which code)

if [ ! -d "$install_path" ]; then
  $git clone https://github.com/fntlnz/dotfiles $install_path
fi

pushd $install_path
$curl -L -o gdb/.gdbinit https://git.io/.gdbinit
$curl -L -o fish/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
$stow nvim
$stow zsh
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

fish -c fisher
