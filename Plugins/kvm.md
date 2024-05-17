

# 安装及加入组（ebtables = iptables-nfs  qemu = qemu-full）
sudo pacman -S  qemu-full virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables libguestfs spice-vdagent

sudo usermod -a -G libvirt rjn
newgrp libvirt

# 配置文件,一定要加双引号
# 请手动输入，echo没有引号
#echo "unix_sock_group = "libvirt"" >> /etc/libvirt/libvirtd.conf

#echo "unix_sock_rw_perms = "0770"" >> /etc/libvirt/libvirtd.conf

# 启用嵌套虚拟化
modprobe -r kvm_intel
modprobe kvm_intel nested=1

# 永久生效,创建以下配置文件
#/etc/modprobe.d/kvm_intel.conf
#options kvm_intel nested=1


# 默认自动启动默认网络
systemctl enable --now libvirtd
virsh net-autostart --network default

# 安装windows时使用bios模式

# 安装windows参考，第一个为 驱动程序，其他为教程
# https://docs.fedoraproject.org/en-US/quick-docs/creating-windows-virtual-machines-using-virtio-drivers/#virtio-win-direct-downloads
# https://raphtlw.medium.com/how-to-set-up-a-kvm-qemu-windows-10-vm-ca1789411760
# https://matteocroce.medium.com/windows-as-qemu-guest-a115a56043b6


# 克隆虚拟机
# https://cloud.tencent.com/developer/article/2017453

