# 更改默认终端

# pulseaudio声卡正常
    使用kmix开启声音即可

# oh-my-zsh
    mv /home/rjn/.oh-my-zsh /usr/share/oh-my-zsh
    .zshrc 文件中的 export ZSH=/usr/share/oh-my-zsh/
    mv /home/rjn/.oh-my-zsh /root/.zshrc

# yay编译手动
    cd /home/rjn/yay
    makepkg -si
    y

# alacritty配置
    vim .config/i3/config   配置terminal为alacritty

# 配置图形   手动优先
    #xrandr --output HDMI-1 --mode 1920x1080 --rate 60
    #echo "xrandr --output HDMI-1 --mode 1920x1080 --rate 60" >> /etc/profile

# nvidia 配置 important
    将‘nomodeset nouveau.modeset=0’参数添加到grub默认条目(GRUB_CNDLINE_LINUX_DEFAULT="*")，然后grub-mkconfig -O
    
# wallpaper
    下载壁纸到～/Picture/wallpaper/*

# vim插件自动安装操作
    vim 启动   ：PlugStatus #查看插件状态  ：PlugInstall #安装之前在配置文件中声明的插件

# 模糊锁屏及自动锁屏
    i3lockr --blur=25 到~/.config/i3/config绑定键
    自动锁屏启动程序已echo到i3config

# 在kvm中安装windwo时使用bios模式

# lightdm 使用sudo启动 light-gtk-greeter-settings管理器
    背景图片可以放在/usr/share/backgrounds///用户目录无法读取
    设置图片的可读取权限

# 默认应用程序gui工具
    yay -S selectdefaultapplication-git
