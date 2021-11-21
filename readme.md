# README

This script aims to install `BaiduPCS-Go` automatically.

```bash
# login
BaiduPCS-Go login -bduss=<BDUSS>

# set parallel download workers
BaiduPCS-Go config set -max_parallel 10

# set parallel download files, set 1 if using rclone mount
BaiduPCS-Go config set -max_download_load 1

# set download dir
# BaiduPCS-Go config set -savedir /content/drive/Shareddrives/baidu/baidugo
# set current dir as download dir,
BaiduPCS-Go config set -savedir $PWD

# set cache size, default 64 KB,
BaiduPCS-Go config set -cache_size 64m

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
curl -sL https://raw.githubusercontent.com/taicaile/drive_utils/master/install.sh | bash
```

To download all files/directories under `ready2download`,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/drive_utils/master/monitor.sh | bash
```

```text
# TODO
- 能够添加一个 server， 可以远程控制下载任务
```

```bash
# get free space for current directory
df -Ph . | tail -1 | awk '{print $4}'
```

## aliyunpan

To install `aliyunpan`

```bash
# this will install aliyunpan for current user
curl -sL https://raw.githubusercontent.com/taicaile/drive_utils/master/install_aliyun.sh | bash
```

Update config,

```bash
# set parallel download workers
# aliyunpan config set --max_download_parallel 10

# set parallel download files, set 1 if using rclone mount
aliyunpan config set -max_download_load 1

# set current dir as download dir,
aliyunpan config set -savedir $PWD

# set cache size, default 64 KB,
aliyunpan config set -cache_size 64m
```

To download files/dirs under `ready2download` directory,

```bash
curl -sL https://raw.githubusercontent.com/taicaile/drive_utils/master/monitor_aliyun.sh| bash
```

Refresh token,

```bash
aliyunpan token update -mode 2

# edit crontab
crontab -e
# add following,
*/60  * * * * aliyunpan token update -mode 2
# restart cron
sudo service cron restart
```
