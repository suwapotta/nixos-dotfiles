#!/usr/bin/env bash

# Warning notification
if [[ $1 -ne 0 ]]; then
  noctalia-shell ipc call toast send '{"title": "Task failed!", "type": "error", "duration": "4000"}'
  exit 1
fi

# Success notification
noctalia-shell ipc call toast send '{"title": "Task succeed!",  "icon": "snowflake"}'
