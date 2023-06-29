#!/bin/bash
##或从aur安装clash   优先
paru -S clash-for-windows-bin
cfw
echo "exec "sleep 2 && cfw &""

#{{{tun模式参考
#原理，关闭系统dns服务，使用clash的dns劫持代替。不用创建虚拟网卡
#https://help.bprolink.com/linux/clash.html
#首先需要下载 Clash Premium 版本，替换上面的 clash 文件。接着需要设置 Linux 系统，开启转发功能。编辑文件 /etc/sysctl.conf，添加以下内容：
net.ipv4.ip_forward=1

#保存退出后，执行以下命令使修改生效：
sudo sysctl -p

#然后接着需要关闭系统的 DNS 服务，使用以下命令：
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved

#然后启用clash中tun按钮，关闭环境变量}}}













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