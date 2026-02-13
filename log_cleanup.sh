#!/bin/bash
LOG_DIR=/var/log
DAYS=7
find $LOG_DIR -type f -mtime +$DAYS -exec rm {} \;
echo "Cleaned logs older than $DAYS days."
