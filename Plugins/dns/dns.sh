#!/bin/bash
#使用dhcpcd自动生成dns配置文件

#在使用clash的dns劫持服务时为使用tun模式，关闭系统dns服务


#在/etc/dhcpcd.conf中配置以下
echo "#禁用钩子停止覆盖dns,resolv.conf" >> /etc/dhcpcd.conf
echo "#nohook resolv.conf" >> /etc/dhcpcd.conf
echo "#指定静态dns地址" >> /etc/dhcpcd.conf
echo "static domain_name_servers=8.8.8.8 114.114.114.114 223.5.5.5" >> /etc/dhcpcd.conf
