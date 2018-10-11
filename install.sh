#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(command -v git)
stow=$(command -v stow)

if [ ! -d "$install_path" ]; then
  $git clone https://github.com/fntlnz/dotfiles "$install_path"
fi

pushd "$install_path"

if [ ! -d i3/.config/i3/i3blocks-contrib ]; then
  $git clone https://github.com/vivien/i3blocks-contrib.git i3/.config/i3/i3blocks-contrib
  pushd i3/.config/i3/i3blocks-contrib/bandwidth2
  make
  popd
fi

if [ ! -d kitty/.config/kitty/themes-contrib ]; then
  $git clone https://github.com/kdrag0n/base16-kitty.git kitty/.config/kitty/themes-contrib
fi

$stow nvim
$stow zsh
$stow tmux
$stow git
$stow gdb
$stow gnupg
#$stow systemd
$stow background
$stow kitty
$stow user-dirs
$stow i3
$stow dunst
$stow screenlayout
$stow xorg
$stow compton
popd

