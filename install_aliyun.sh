#!/usr/bin/bash

set -e

PROGRAM=aliyunpan
USER_REPO=tickstep/aliyunpan

if ! command -v "$PROGRAM" &>/dev/null;  then

    curl -s https://api.github.com/repos/$USER_REPO/releases/latest \
    | grep "browser_download_url.*linux-amd64" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -O installer.zip -qi -

    unzip -j -d installer installer.zip

    cp installer/$PROGRAM /usr/local/bin/

    rm -rf installer
    rm installer.zip
fi
