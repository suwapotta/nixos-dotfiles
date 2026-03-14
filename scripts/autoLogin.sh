#!/usr/bin/env bash

CYAN="\e[0;36m"
NO_COLOR="\e[0m"
CURRENT_TTY=$(tty)

if [[ "$CURRENT_TTY" == "/dev/tty1" ]]; then
  exec niri-session
fi
echo -e "${CYAN}Welcome to TTY!${NO_COLOR}"
