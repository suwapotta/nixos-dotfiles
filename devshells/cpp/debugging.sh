#!/usr/bin/env bash

echo -n "Mode [GTEST/pytest]: "
read -r OPTION
if [[ -z "$OPTION" ]]; then
  MODE="gtest"
else
  MODE="pytest"
fi

fd . src/ tests/ | entr -c bash -c "make ${MODE}"
