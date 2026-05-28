#!/usr/bin/env bash

echo -n "[CTEST/pytest]: "
read -r OPTION
if [[ -z "$OPTION" ]]; then
  MODE="ctest"
else
  MODE="pytest"
fi

fd . src/ tests/ | entr -c bash -c "make ${MODE}"
