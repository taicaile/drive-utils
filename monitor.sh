#!/usr/bin/bash

set -e

MONITOR_DIR=ready2download
COMMAND=BaiduPCS-Go

while :
do

    FILES=$($COMMAND tree --depth 0 "$MONITOR_DIR")
    IFS=$'\n'
    for LINE in $FILES; do
        FILE=$(echo "$LINE" | cut -d " " -f 2-)
        echo "[Download]: $MONITOR_DIR/$FILE"
        $COMMAND d "$MONITOR_DIR/$FILE" && $COMMAND rm "$MONITOR_DIR/$FILE"
    done

    sleep $(( (RANDOM % 5)  + 5 ))h

done
