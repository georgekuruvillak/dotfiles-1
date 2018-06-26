#!/usr/bin/env bash

set -xeuo pipefail

config=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/$config.sh

feh --bg-scale $HOME/.config/background/background.jpg

