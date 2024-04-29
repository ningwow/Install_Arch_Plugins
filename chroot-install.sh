##设置时区
time_zone() {
    local i_val=$1  # 使用 local 关键字定义局部变量，它只在此函数内有效
    # 在这里，你可以添加更多的代码来处理 i_val，比如数据库操作、文件处理等
    ln -sf /usr/share/zoneinfo/$i_val /etc/localtime
}
#设置语言环境
language_env() {
    local i_val=$1  # 使用 local 关键字定义局部变量，它只在此函数内有效
    # 在这里，你可以添加更多的代码来处理 i_val，比如数据库操作、文件处理等
    echo -e "en_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8" >> /etc/locale.gen
    locale-gen
    echo "LANG=$i_val.UTF-8" >> /etc/locale.conf

}
#设置键盘布局
key_map() {
    local i_val=$1  # 使用 local 关键字定义局部变量，它只在此函数内有效
    # 在这里，你可以添加更多的代码来处理 i_val，比如数据库操作、文件处理等
    echo "KEYMAP = $i_val" >> /etc/vconsole.conf

}
#设置主机名
set_hostname() {
    local i_val=$1  # 使用 local 关键字定义局部变量，它只在此函数内有效
    # 在这里，你可以添加更多的代码来处理 i_val，比如数据库操作、文件处理等
    echo "$i_val" >> /etc/hostname   #主机名
}
#设置用户密码
set_passwd() {
    local i_val=$1  # 使用 local 关键字定义局部变量，它只在此函数内有效
    # 在这里，你可以添加更多的代码来处理 i_val，比如数据库操作、文件处理等
    echo "root:$i_val" | chpasswd
    useradd -m -G wheel  rjn   #创建新用户并设置密码
    echo "rjn:$i_val" | chpasswd
}

#设置时区
input=""
while true; do
    # 提示用户输入值或直接按回车键选择默认操作
    echo "input timezone(Asia/Shanghai)::"
    read input

    # 检查输入是否为空，若为空执行默认操作并退出循环
    if [[ -z "$input" ]]; then
        echo "No input provided. default"
        # 默认操作代码，可以根据需要进行修改
        ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
        break  # 退出 while 循环
    elif [[ "$input" == "quit" ]]; then
        # 提供了一个退出脚本的选项，当用户输入 "quit" 时，脚本将结束
        echo "Exiting program."
        exit 0
    else
        # 如果提供了非空输入，调用 perform_action 函数并传递输入
        time_zone "$input"
        break
    fi
done

#设置语言环境
input=""
while true; do
    # 提示用户输入值或直接按回车键选择默认操作
    echo "input language(one of en_US.UTF-8 UTF-8 and zh_CN.UTF-8 UTF-8 eg:en_US):"
    read input

    # 检查输入是否为空，若为空执行默认操作并退出循环
    if [[ -z "$input" ]]; then
        echo "No input provided. default"
        # 默认操作代码，可以根据需要进行修改
        echo -e "en_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8" >> /etc/locale.gen
        locale-gen
        echo "LANG=en_US.UTF-8" >> /etc/locale.conf
        break  # 退出 while 循环
    elif [[ "$input" == "quit" ]]; then
        # 提供了一个退出脚本的选项，当用户输入 "quit" 时，脚本将结束
        echo "Exiting program."
        exit 0
    else
        # 如果提供了非空输入，调用 perform_action 函数并传递输入
        time_zone "$input"
        break
    fi
done

#设置键盘布局
input=""
while true; do
    # 提示用户输入值或直接按回车键选择默认操作
    echo "input key_map(us):"
    read input

    # 检查输入是否为空，若为空执行默认操作并退出循环
    if [[ -z "$input" ]]; then
        echo "No input provided. default"
        # 默认操作代码，可以根据需要进行修改
        echo "KEYMAP = us" >> /etc/vconsole.conf
        break  # 退出 while 循环
    elif [[ "$input" == "quit" ]]; then
        # 提供了一个退出脚本的选项，当用户输入 "quit" 时，脚本将结束
        echo "Exiting program."
        exit 0
    else
        # 如果提供了非空输入，调用 perform_action 函数并传递输入
         key_map "$input"
         break
    fi
done

#设置主机名
input=""
while true; do
    # 提示用户输入值或直接按回车键选择默认操作
    echo "input hostname(First):"
    read input

    # 检查输入是否为空，若为空执行默认操作并退出循环
    if [[ -z "$input" ]]; then
        echo "No input provided. default"
        # 默认操作代码，可以根据需要进行修改
        echo "First" >> /etc/hostname
        break  # 退出 while 循环
    elif [[ "$input" == "quit" ]]; then
        # 提供了一个退出脚本的选项，当用户输入 "quit" 时，脚本将结束
        echo "Exiting program."
        exit 0
    else
        # 如果提供了非空输入，调用 perform_action 函数并传递输入
        set_hostname "$input"
        break
    fi
done

#设置host文件
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.0.1 First" >> /etc/hosts
echo "%wheel    ALL=(ALL:ALL) ALL" >> /etc/sudoers

#初始化文件,initramfs (initial ram filesystem) 是一个临时的根文件系统
mkinitcpio -P

#设置用户密码
input=""
while true; do
    # 提示用户输入值或直接按回车键选择默认操作
    echo "input passwd for user and root:"
    read -s input

    # 检查输入是否为空，若为空执行默认操作并退出循环
    if [[ -z "$input" ]]; then
        echo "passwd is null"
        continue
    elif [[ "$input" == "quit" ]]; then
        # 提供了一个退出脚本的选项，当用户输入 "quit" 时，脚本将结束
        echo "Exiting program."
        exit 0
    else
        # 如果提供了非空输入，调用 perform_action 函数并传递输入
        set_passwd "$input"
        break
    fi
done

echo "即将安装引导加载程序"
#安装引导加载程序   /important
pacman -S --noconfirm grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot/ --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

echo "即将安装基本功能包"
#安装基本功能
pacman -S --noconfirm sudo acpi acpid rust go    #安装杂项
pacman -S --noconfirm ntfs-3g intel-ucode   #文件系统实用程序/后续补充
#pacman -S --noconfirm alsa-utils pulseaudio pulseaudio-bluetooth pulseaudio-alsa pulseaudio-jack pulseaudio-lirc sof-firmware alsa-ucm-conf kmix  #声音服务器及其他声音程序
pacman -S --noconfirm alsa-utils pipewire pipewire-pulse pipewire-alsa sof-firmware alsa-ucm-conf kmix  #使用这个，更高级，支持更多，
pacman -S --noconfirm pavucontrol   #音频管理软件，比装，横好用
pacman -S --noconfirm networkmanager network-manager-applet dhcpcd networkmanager-openvpn openvpn     #网络服务程序
systemctl enable NetworkManager

echo "显卡驱动自选，无安装任何显卡驱动，只有内置开源驱动n"
#安装nvidia驱动程序或暂时安装开源驱动程序
#pacman -S xf86-video-nouveau       #开源驱动程序

echo "创建用户英文家目录"
#安装工具，创建用户下强制创建英文目录
pacman -S --noconfirm xdg-user-dirs
su rjn -c "LC_ALL=C xdg-user-dirs-update --force"
LC_ALL=C xdg-user-dirs-update --force

#现在这是一个只有命令行的arch

echo -e " finshed \n please install other drivers \n please exec exit and umount -lR /mnt "