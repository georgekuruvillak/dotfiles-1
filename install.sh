#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(which git)
stow=$(which stow)

$git clone https://github.com/fntlnz/dotfiles $install_path

pushd $install_path
$stow vim
$stow tmux
$stow git
$stow gdb
$stow dunst
$stow i3
$stow pam
$stow systemd
$stow screenlayout
$stow zsh
$stow vscode
popd
