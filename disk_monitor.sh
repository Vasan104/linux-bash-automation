#!/bin/bash
THRESHOLD=80
df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1)
  partition=$(echo $output | awk '{ print $2 }')
  if [ $usep -ge $THRESHOLD ]; then
    echo "Disk usage alert: $partition ($usep%)"
  fi
done
