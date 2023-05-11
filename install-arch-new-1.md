# 查看是否为efi启动模式
    ls /sys/firmware/efi/efivars

# 检查网络连接
    ip a

# 设置时间
    timedatectl     查看时间
    timedatectl set-timezone Asia/Shanghai  #设置时区

# 磁盘分区
    lsblk   #查看磁盘情况
    cfdisk /dev/...     #efi分区/home分区/根分区/swap分区
    
    mkfs.fat -F 32 /dev/...     #格式化efi分区
    mkfs.ext4 /dev/...      #格式化正常分区
    mkswap /dev/...     #格式花swap分区

# 挂载文件系统
    mount /dev/... /mnt     #挂载普通分区
    mount --mkdir /dev/... /mnt/boot    #挂载boot引导分区
    swapon /dev/...     #启用swap分区

# 选择mirror镜像    /任选其一
    1.curl https://archlinux.org/mirrorlist/?country=CN > /etc/pacman.d/mirrorlist    #然后去掉注释
    2.reflector --country China --protocol https --sort rate --save /etc/pacman.d/mirrorlist

# 安装基本包    /important
    pacstrap -K /mnt base linux linux-firmware git vim

# 生成fstab文件     important
    genfstab -U /mnt >> /mnt/etc/fstab

# arch-chroot /mnt      /chroot到新系统

