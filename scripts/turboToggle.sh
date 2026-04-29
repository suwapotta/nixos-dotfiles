#!/usr/bin/env bash

TURBO_PATH="/sys/devices/platform/msi-ec/cooler_boost"
TURBO_STATUS=$(cat ${TURBO_PATH})

if [[ "${TURBO_STATUS}" = "on" ]]; then
  echo "off" | sudo tee ${TURBO_PATH} &>/dev/null
  exit
fi

echo "on" | sudo tee ${TURBO_PATH} &>/dev/null
