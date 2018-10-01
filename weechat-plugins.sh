#!/usr/bin/env bash

set -xeuo pipefail

function get_plugin() {
  $curl -L -o $1 $2
  eval $3 # post-installation callback
}

weechat_path=$HOME/.weechat

curl=$(command -v curl)

pushd "$weechat_path"
pushd python/autoload
get_plugin autosort.py https://raw.githubusercontent.com/de-vri-es/weechat-autosort/master/autosort.py ""
get_plugin wee_slack.py https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py "pip install websocket-client"
get_plugin notify_send.py https://raw.githubusercontent.com/s3rvac/weechat-notify-send/master/notify_send.py ""
get_plugin edit.py https://raw.githubusercontent.com/keith/edit-weechat/master/edit.py ""
popd
popd


