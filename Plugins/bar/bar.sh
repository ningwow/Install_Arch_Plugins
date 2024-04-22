#!/bin/bash

#不搞polybar.太麻烦i3bar有主题，也很好看
#pacman -S --noconfirm polybar

#使用i3-status
#mkdir /home/rjn/.config/i3status
#cp /etc/i3status.conf /home/rjn/.config/i3status/config


#克隆插件目录
cd /home/rjn/
su rjn -c "git clone https://github.com/vivien/i3blocks-contrib.git"
#command=一定要写对路径
mv i3blocks-contrib scripts
mv scripts /home/rjn/.config/i3/
#i3status or i3blocks 是同一种作用，推荐使用i3blocks

#更改i3config配置文件，bar为i3blocks
cp  i3blocks.conf /home/rjn/.config/i3/

##########借鉴与：https://github.com/vivien/i3blocks-contrib

#cpu使用率（依赖mpstat,于sysstat包含）
pacman -S --noconfirm sysstat

#cpu温度
#https://github.com/jplatte/i3blocks-scripts/blob/master/cpu-temp
#在i3blocks中写入配置文件




#亮度显示(默认以安装)
#btightness
#需要在brightness目录中sudo make release，然后生成到bin中

#电池信息
#pacman -S --noconfirm acpi




#调光器（放置高亮看不清）

#磁盘使用情况
#LABEL=标签

#显示wifi上网百分比

#带宽指示
#使用bandwidth2,需要make

