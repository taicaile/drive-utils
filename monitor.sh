#!/usr/bin/bash

set -e

MONITOR_DIR=ready2download
COMMAND=BaiduPCS-Go

# Program validation
if ! command -v $COMMAND &> /dev/null; then
    echo "$COMMAND 未安装，退出程序"
    exit 1
fi

# Account validation
if ! $COMMAND who | grep -q "uid" ; then
    echo "未找到有效帐号，退出程序"
    exit 1
fi

# check if the directory being monitored exists
if ! $COMMAND ls "$MONITOR_DIR" | grep -q "文件大小"; then
    echo "$ 目录不存在，退出程序"
    exit 1
fi

while :
do

    FILES=$($COMMAND tree --depth 0 "$MONITOR_DIR")
    IFS=$'\n'
    for LINE in $FILES; do
        FILE=$(echo "$LINE" | cut -d " " -f 2-)
        if [ -n "$FILE" ] && [ "$FILE" != " " ];then
            echo "[Download]: $MONITOR_DIR/$FILE"
            $COMMAND d "$MONITOR_DIR/$FILE" && $COMMAND rm "$MONITOR_DIR/$FILE"
        fi
    done

    SLEEP_RANDOM=$(( (RANDOM % 5)  + 5 ))h
    echo "ready to sleep for $SLEEP_RANDOM, now is $(date)"
    sleep $RANDOM

done
