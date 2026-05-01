#!/usr/bin/env bash

EXIT_CODE="${1:-0}"

C_RED="\033[1;31m"
C_GREEN="\033[1;32m"
C_RESET="\033[0m"

IS_GUI_RUNNING() {
  pgrep ".quickshell-wra" &>/dev/null
}

# Warning notification
if [[ "$EXIT_CODE" -ne 0 ]]; then
  printf '%b   FAILED  %b Task\n' "$C_RED" "$C_RESET"

  if IS_GUI_RUNNING; then
    noctalia-shell ipc call toast send '{"title": "Task failed!", "type": "error", "duration": "4000"}'
  fi

  exit 1
fi

# Success notification
printf '%b   SUCCESS %b Task\n' "$C_GREEN" "$C_RESET"

if IS_GUI_RUNNING; then
  noctalia-shell ipc call toast send '{"title": "Task succeed!",  "icon": "snowflake"}'
fi

exit 0
