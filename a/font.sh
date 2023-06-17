#/bin/bash

#安装字体。这是新的字体包

#编程字体
pacman -S --confirm noto-fonts noto-fonts-cjk wqy-microhei wqy-zenhei adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts adobe-source-han-sans-tw-fonts adobe-source-han-sans-hk-fonts adobe-source-han-serif-tw-fonts adobe-source-han-serif-hk-fonts
#  paru -S ttf-google-fonts-git ttf-mononoki ttf-inconsolata-g ttf-ms-win10-zh_cn ttf-ms-win10-zh_tw

pacman -S ttf-font-awesome

##emoji
pacman -S noto-fonts-emoji
#paru -S ttf-symbola