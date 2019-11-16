#!/usr/bin/env bash

set -xeuo pipefail

install_path=$HOME/.dotfiles

git=$(command -v git)
stow=$(command -v stow)

if [ ! -d "$install_path" ]; then
  $git clone https://github.com/fntlnz/dotfiles "$install_path"
fi

source $install_path/scripts/func.sh

check_os

pushd "$install_path"
$stow home
$stow nvim
$stow zsh
$stow tmux
$stow git
$stow gdb
$stow ssh
$stow gnupg
setup_gnupg
setup_pinentry
$stow kitty
popd

if [[ "$os" = "darwin" ]]; then
  code=$(command -v code-insiders)
  $code --install-extension eamodio.gitlens
  $code --install-extension eamodio.remotehub
  $code --install-extension ms-vscode.Go
  $code --install-extension ms-vscode.cpptools
  $code --install-extension vscjava.vscode-java-pack
  $code --install-extension twxs.cmake
  $code --install-extension vector-of-bool.cmake-tools
  $code --install-extension zxh404.vscode-proto3
  $code --install-extension ms-python.python
  $code --install-extension rust-lang.rust
  $code --install-extension devondcarew.bazel-code
  $code --install-extension timonwong.shellcheck
  $code --install-extension yzhang.markdown-all-in-one
  $code --install-extension joaompinto.asciidoctor-vscode
  $code --install-extension slevesque.vscode-hexdump
  $code --install-extension alefragnani.bookmarks
  $code --install-extension vstirbu.vscode-mermaid-preview
  $code --install-extension ms-vscode-remote.vscode-remote-extensionpack
  $code --install-extension plorefice.devicetree
  $code --install_extension matepek.vscode-catch2-test-adapter
  $code --install_extension github.vscode-pull-request-github
fi
