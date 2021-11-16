#!/usr/bin/bash

set -e

MONITOR_DIR=ready2download

FILES=$(BaiduPCS-Go tree --depth 0 "$MONITOR_DIR")
IFS=$'\n'
for LINE in $FILES; do
    FILE=$(echo "$LINE" | cut -d " " -f 2-)
    BaiduPCS-Go d "$MONITOR_DIR/$FILE" && BaiduPCS-Go rm "$MONITOR_DIR/$FILE"
done
