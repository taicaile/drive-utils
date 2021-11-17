# README

This script aims to install `BaiduPCS-Go` automatically.

```bash
# login
BaiduPCS-Go login -bduss=<BDUSS>
# set parallel download threads
BaiduPCS-Go config set -max_parallel 10
# set parallel download files
BaiduPCS-Go config set -max_download_load 2

# set download dir
BaiduPCS-Go config set -savedir /content/drive/Shareddrives/baidu/baidugo

# set current dir as download dir,
BaiduPCS-Go config set -savedir $PWD
```

Monitor a specific directory, if any file inside, download it and remove it if success.

```bash
# list all files under `ready2download` directory,
BaiduPCS-Go ls ready2download
BaiduPCS-Go tree --depth 0 ready2download
BaiduPCS-Go tree --depth 0  ready2download | cut -d " " -f 2

# download
BaiduPCS-Go d ready2download/xxx/
```

To install `BaiduPCS-Go`,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/drive_baidu/master/install.sh | bash
```

To download all files/directories under `ready2download`,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/drive_baidu/master/monitor.sh | bash
```

```text
# TODO
- 能够添加一个 server， 可以远程控制下载任务
```

```bash
# get free space for current directory
df -Ph . | tail -1 | awk '{print $4}'
```
