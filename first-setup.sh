#!/bin/bash
apt update
apt upgrade -y
apt dist-upgrade -y
apt install -y git acl docker-compose screen
if [ ! -f /swapfile ]; then
    fallocate -l 4G /swapfile
    chmod 600 /swapfile
    mkswap /swapfile
    swapon /swapfile
    cp /etc/fstab /etc/fstab.preswap.bak
    echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
fi