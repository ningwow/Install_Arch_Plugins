# #使用kitty
# kitty
# #使用以下命令切换主题
# kitty +kitten themes
# Dark *

#!/bin/bash
sudo pacman -S --noconfirm alacritty
#配置文件难找
su $USER -c "mkdir -p /home/rjn/.config/alacritty/"
su $USER -c "cp -r alacritty/alacritty.toml > /home/rjn/.config/alacritty/alacritty.toml"
su $USER -c "cp -r alacritty/themes > /home/rjn/.config/alacritty/"
# 主题颜色配置
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

#手动配置
# 颜色配置参考 https://github.com/alacritty/alacritty-theme

#透明配置，需要picom合成器启动才能生效，及其重要
