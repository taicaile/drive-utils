#!/usr/bin/bash

# to check if rclone is installed

if ! command -v "rclone"; then
    curl https://rclone.org/install.sh | sudo bash
fi

# check rclone config
