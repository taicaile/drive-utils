#/usr/bin/bash

set -e

if ! command -v "BaiduPCS-Go" &>/dev/null;  then

    curl -s https://api.github.com/repos/qjfoidnh/BaiduPCS-Go/releases/latest \
    | grep "browser_download_url.*linux-amd64" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -O BaiduPCS.zip -qi -

    unzip -j -d BaiduPCS BaiduPCS.zip

    cp BaiduPCS/BaiduPCS-Go /usr/local/bin/

    rm -rf BaiduPCS
    rm BaiduPCS.zip

fi

