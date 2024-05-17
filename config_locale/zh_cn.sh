echo '##########################################' >> /home/rjn/.profile
echo '##chinese settiing' >> /home/rjn/.profile
echo 'export LANG=zh_CN.UTF-8' >> /home/rjn/.profile
echo 'export LANGUAGE=zh_CN:en_US' >> /home/rjn/.profile
echo 'export LC_CTYPE=en_US.UTF-8' >> /home/rjn/.profile
echo '#' >> /home/rjn/.profile
echo '#' >> /home/rjn/.profile
echo '#' >> /home/rjn/.profile
echo 'export LC_MESSAGES=zh_CN.UTF-8' >> /home/rjn/.profile
echo 'export LC_TIME=zh_CN.UTF-8' >> /home/rjn/.profile

echo '##########################################' >> /home/rjn/.profile
echo '##chinese input fcitx5' >> /home/rjn.profile
echo 'export GTK_IM_MODULE="fcitx"' >> /home/rjn/.profile
echo 'export QT_IM_MODULE="fcitx"' >> /home/rjn/.profile
echo 'export XMODIFIERS="@im=fcitx"' >> /home/rjn/.profile
echo 'export XIM_PROGRAM="fcitx"' >> /home/rjn/.profile
echo '#下面这一行能让telegram输入中文' >> /home/rjn/.profile
echo 'export INPUT_METHOD="fcitx"' >> /home/rjn/.profile
echo 'export SDL_IM_MODULE="fcitx"' >> /home/rjn/.profile
echo 'export XIM="fcitx"' >> /home/rjn/.profile
echo 'export SDL_IM_MODULE DEFAULT="fcitx"' >> /home/rjn/.profile


echo '##########################################' >> /home/rjn/.profile
echo '#export LIBVA_DRIVER_NAME='vdpau' \\\\视频硬件加速,详看https://wiki.archlinux.org/title/Hardware_video_acceleration' >> /home/rjn/.profile
echo '#export LIBVA_DRIVERS_PATH='/usr/lib/dri/'' >> /home/rjn/.profile
echo '#export VDPAU_DRIVER='nvidia'' >> /home/rjn/.profile

echo '#--gnome密钥环;   \\gnome密钥环还不懂,略过' >> /home/rjn/.profile
echo 'eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"' >> /home/rjn/.profile
echo '#export SSH_AUTH_SOCK' >> /home/rjn/.profile
echo '' >> /home/rjn/.profile


fcitx5 &
#echo 'exec --no-startup-id fcitx5' >> /home/rjn/.config/i3/config
#手动操作
#echo 'please:1.stop fcitx5  2.vim .config/fcitx5/conf/pinyin.conf PreeditInApplication=False '