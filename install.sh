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

if [ ! -d i3/.i3/i3blocks-contrib ]; then
  $git clone https://github.com/vivien/i3blocks-contrib.git i3/.i3/i3blocks-contrib
  pushd i3/.i3/i3blocks-contrib/bandwidth2
  make
  popd
fi

$stow vim
$stow zsh
$stow tmux
$stow git
$stow gdb
$stow gnupg
$stow pam
$stow systemd
$stow background
$stow kitty
$stow user-dirs
$stow i3
$stow dunst
$stow screenlayout
popd

