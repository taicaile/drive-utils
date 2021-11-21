#!/usr/bin/bash

MONITOR_DIR=ready2download
COMMAND=aliyunpan

# Program validation
if ! command -v $COMMAND &> /dev/null; then
    echo "$COMMAND 未安装，退出程序"
    exit 1
fi

# account validation
if ! $COMMAND who | grep -q "UID" ; then
    echo "未找到有效帐号，退出程序"
    exit 1
fi

# check if the directory being monitored exists
if ! $COMMAND ls "$MONITOR_DIR" | grep -q "文件大小"; then
    echo "$ 目录不存在，退出程序"
    exit 1
fi

FILES=$($COMMAND ls "$MONITOR_DIR" |  head -n -2 | tail -n +2)

IFS=$'\n'
for LINE in $FILES; do
    FILE="${LINE:36}"
    if [ -n "$FILE" ] && [ "$FILE" != " " ];then
        echo "[Download]: $MONITOR_DIR/$FILE"
        $COMMAND d "$MONITOR_DIR/$FILE" && $COMMAND rm "$MONITOR_DIR/$FILE"
    fi
done
