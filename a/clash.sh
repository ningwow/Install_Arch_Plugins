#!/bin/bash
##因为权限问题及解决方法setcap无效问题，手动开启tun
#手动开启tun模式
#创建 /usr/lib/systemd/system/clash-core-service.service 
{
[Unit]
Description=Clash core service created by Clash for Windows
After=network-online.target nftables.service iptables.service

[Service]
Type=simple
ExecStart=/opt/clash.for.windows/resources/static/files/linux/x64/service/clash-core-service
Restart=always
RestartSec=5

[Install]
WantedBy=multi-user.target
}
systemctl enable --now clash-core-service.service 
#然后重启clash，一切正常

#安装clash
wget https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.20.22/Clash.for.Windows-0.20.22-x64-linux.tar.gz
tar -zxvf Clash.for.Windows-0.20.22-x64-linux.tar.gz
mv Clash\ for\ Windows-0.20.22-x64-linux clash
sudo mv clash /usr/share/clash
echo "exec "sleep 2 && /usr/share/clash/cfw &""

##或从aur安装clash   优先
paru -S clash-for-windows-bin
cfw
echo "exec "sleep 2 && cfw &""


#普通代理（没有tun模式的情况下）
sudo chmod 666 /etc/environment
#编辑文件 /etc/environment
echo "all_proxy=socks5://127.0.0.1:7890/" >> /etc/environment
echo "http_proxy=http://127.0.0.1:7890/" >> /etc/environment
echo "https_proxy=http://127.0.0.1:7890/" >> /etc/environment
echo "ftp_proxy=http://127.0.0.1:7890/" >> /etc/environment
echo "HTTP_PROXY=http://127.0.0.1:7890/" >> /etc/environment
echo "HTTPS_PROXY=http://127.0.0.1:7890/" >> /etc/environment
echo "FTP_PROXY=http://127.0.0.1:7890/" >> /etc/environment
sudo chmod 444 /etc/environment