#!/usr/bin/env bash

# Warning notification
if [[ $1 -ne 0 ]]; then
  noctalia-shell ipc call toast send '{"title": "Build failed!", "type": "error", "duration": "4000"}'
  exit
fi

# Success notification
noctalia-shell ipc call toast send '{"title": "Build succeed!",  "icon": "snowflake"}'
