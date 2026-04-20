#!/usr/bin/env bash

# # quickshell + noctalia-shell restart
# if pkill -0 .quickshell-wra; then
#   pkill .quickshell-wra
#   noctalia-shell &>/dev/null &
#   disown
# fi
#
# Warning notification
if [[ $1 -ne 0 ]]; then
  noctalia-shell ipc call toast send '{"title": "Build failed!", "type": "error", "duration": "4000"}'
  exit
fi

# Success notification
noctalia-shell ipc call toast send '{"title": "Build succeed!",  "icon": "snowflake"}'
