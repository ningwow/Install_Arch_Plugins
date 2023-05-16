#!/bin/bash
wget https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.20.22/Clash.for.Windows-0.20.22-x64-linux.tar.gz
tar -zxvf Clash.for.Windows-0.20.22-x64-linux.tar.gz
mv Clash\ for\ Windows-0.20.22-x64-linux clash
sudo mv clash /usr/share/clash
echo "exec sleep 2 && /usr/share/clash/cfw &"

#普通代理（没有tun模式的情况下）
sudo chmod 666 /etc/environment
#编辑文件 /etc/environment
echo "http_proxy=http://127.0.0.1:7890/" >> /etc/environment
echo "https_proxy=http://127.0.0.1:7890/" >> /etc/environment
echo "ftp_proxy=http://127.0.0.1:7890/" >> /etc/environment
echo "HTTP_PROXY=http://127.0.0.1:7890/" >> /etc/environment
echo "HTTPS_PROXY=http://127.0.0.1:7890/" >> /etc/environment
echo "FTP_PROXY=http://127.0.0.1:7890/" >> /etc/environment
sudo chmod 444 /etc/environment