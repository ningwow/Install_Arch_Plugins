
echo "base package"
# 安装基本功能
pacman -S --noconfirm  intel-ucode base-devel acpi acpid ntfs-3g    #安装杂项
# 音频
pacman -S --noconfirm alsa-utils pipewire pipewire-pulse pipewire-alsa sof-firmware alsa-ucm-conf pavucontrol  #使用这个，更高级，支持更多，
# 网络
pacman -S --noconfirm  network-manager-applet dhcpcd networkmanager-openvpn openvpn     #网络服务程序
systemctl enable dhcpcd