#/usr/bin/bash

set -e

MONITOR_DIR=ready2download

FILES=`BaiduPCS-Go tree --depth 0 "$MONITOR_DIR" | cut -d " " -f 2`
for FILE in $FILES; do
    BaiduPCS-Go d "$MONITOR_DIR/$FILE" && BaiduPCS-Go rm "$MONITOR_DIR/$FILE"
done
