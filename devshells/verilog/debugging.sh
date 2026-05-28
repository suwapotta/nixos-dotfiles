#!/usr/bin/env bash

echo -n "Mode [PYTEST/test.no]: "
read -r OPTION
if [[ -z "$OPTION" ]]; then
  MODE="pytest"
  fd . src/ tests/ | entr -c bash -c "make ${MODE} -B"
elif [[ $OPTION =~ ^[0-9]+$ ]]; then
  printf -v ARG "test_%03d" "$OPTION"
  fd . src/ tests/ | entr -c bash -c "make TEST=${ARG} build/${ARG}.vcd -B"
fi
