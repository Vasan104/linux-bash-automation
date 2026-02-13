#!/bin/bash
SERVICES="ssh docker"
for service in $SERVICES; do
  if systemctl is-active --quiet $service; then
    echo "$service is running"
  else
    echo "$service is down" && sudo systemctl start $service
  fi
done
