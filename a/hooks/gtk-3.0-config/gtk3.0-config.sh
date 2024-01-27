#!/bin/bash

#pacman的更新log在/var/log/pacman.log中，解决问题请查看log
#防止每次更新gtk后系统gtk3.0的配置文件被覆盖
cp gtk-config-custom.hook /usr/share/libalpm/hooks/gtk-config-custom.hook
cp gtk-config-custom /usr/share/libalpm/scripts/gtk-config-custom