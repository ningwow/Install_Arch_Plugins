echo '##########################################' >> /etc/environment
echo '##chinese settiing' >> /etc/environment
echo 'LANG=zh_CN.UTF-8' >> /etc/environment
echo 'LANGUAGE=zh_CN:en_US' >> /etc/environment
echo 'LC_CTYPE=en_US.UTF-8' >> /etc/environment
echo '#' >> /etc/environment
echo 'LC_MESSAGES=zh_CN.UTF-8' >> /etc/environment
echo 'LC_TIME=zh_CN.UTF-8' >> /etc/environment

echo '##########################################' >> /etc/environment
echo '##chinese input fcitx5' >> /etc/environment
echo 'GTK_IM_MODULE="fcitx"' >> /etc/environment
echo 'QT_IM_MODULE="fcitx"' >> /etc/environment
echo 'XMODIFIERS="@im=fcitx"' >> /etc/environment
echo 'XIM_PROGRAM="fcitx"' >> /etc/environment
echo 'INPUT_METHOD="fcitx"' >> /etc/environment
echo 'SDL_IM_MODULE="fcitx"' >> /etc/environment
echo 'XIM="fcitx"' >> /etc/environment
echo 'SDL_IM_MODULE DEFAULT="fcitx"' >> /etc/environment


echo '##########################################' >> /etc/environment
echo '#LIBVA_DRIVER_NAME='vdpau' \\\\视频硬件加速,详看https://wiki.archlinux.org/title/Hardware_video_acceleration' >> /etc/environment
echo '#LIBVA_DRIVERS_PATH='/usr/lib/dri/'' >> /etc/environment
echo '#VDPAU_DRIVER='nvidia'' >> /etc/environment

echo '#--gnome密钥环;   \\gnome密钥环还不懂,略过' >> /etc/environment
echo '#eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"' >> /etc/environment
echo '#SSH_AUTH_SOCK' >> /etc/environment
echo '' >> /etc/environment


#fcitx5 &
#echo 'exec --no-startup-id fcitx5' >> /home/rjn/.config/i3/config
#手动操作
#echo 'please:1.stop fcitx5  2.vim .config/fcitx5/conf/pinyin.conf PreeditInApplication=False '