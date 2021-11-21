#!/usr/bin/bash

set -e

PROGRAM=aliyunpan
USER_REPO=tickstep/aliyunpan
PROGRAM_DIR=~/.local/bin/
mkdir -p $PROGRAM_DIR

if ! command -v "$PROGRAM" &>/dev/null;  then

    curl -s https://api.github.com/repos/$USER_REPO/releases/latest \
    | grep "browser_download_url.*linux-amd64" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -O installer.zip -qi -

    unzip -o -j -d installer installer.zip

    cp installer/$PROGRAM $PROGRAM_DIR

    rm -rf installer
    rm installer.zip
fi
