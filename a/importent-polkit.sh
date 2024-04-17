#!/bin/bash


# https://wiki.archlinux.org/title/Polkit
# 提供图形化下的权限提升：弹窗认证，很有用。
# 安装其中一个热门桌面的包，然后启动

#建议使用gnome的，这个服务一直运行，sudo pacman -S polkit-gnome
#ked的每运行一次必须重新运行程序
#将安装的程序路径
#通过在i3配置文件中配置自启动 exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

#使用此执行文件在/usr/bin/polkit-gnome 下执行
#!/bin/bash
# /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
~