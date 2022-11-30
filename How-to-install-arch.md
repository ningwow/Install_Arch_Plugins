# 查看网络连接
	ip a
	
	连接wlan
	iwctl
	devices list
	station wlan0 connect <wlan_name>

# 对磁盘分区
	lsblk
	
#### gdisk /dev/disk_name
	
	n(创建新表)
	enter区间编号（default'1'）
	enter(defaule)(第一个扇区开始)
	+512M (efi分区)
	“Hex code or GUID:efoo”(ef00是efi分区的代码)
	
	n(创建第二个分区)
	enter
	开始扇区
	结束扇区（default=‘最大’）
	“Hex code or GUID:enter”（默认）
	 
	 w(write)
	 y
	 
	 lsblk

## 格式化分区
##### 格式化efi分区
	mkfs.fat -F32 /dev/efi
##### 格式化主分区
	mkfs.btrfs /dev/what  *现在还没搞懂*
##### 格式化swap分区
	mkswap /dev/what


# reflector（更新镜像源）

	update mirror with command reflector
	让我们检索前 20 个最新的镜像，并按下载率对镜像列表进行排序，并/etc/pacman.d/mirrorlist使用命令将它们保存在文件中：

	$ sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
	请注意，这将用新镜像替换现有镜像。

### 让我们分解上面的命令，看看每个选项的作用。

	--latest 20-获取最近同步的服务器
	--protocol https-检索https启用的镜像
	--sort rate-根据下载率排序镜像列表
	--verbose- 打印比正常情况更多的信息。
	--country 'china'- 我的首选镜像位置。
	--l 5 --age 12 - 检索国家12个小时内同步过的前五名镜子。
	--age 12 -12个小时同步过的
	-f 5  -最快的5个镜像
	--save /etc/pacman-d/mirrorlist.
	
#### 示例

	中国和美国下载率前5名https保存到/etc/pacman-d/mirrorlist	
	
	$ sudo reflector --country 'China,United States' -l 5 --sort rate --protocol https  --save /etc/pacman-d/mirrorlist
	
	
#### 获取所有按国家地区排名的镜像	
	$ sudo curl -o /etc/pacman.d/mirrorlist https://archlinux.org/mirrorlist/all/ 或Chian
	然后在/etc/pacman.d/mirrorlist取消注释你需要的镜像
	
	
# 安装	
## 使用pacstrap命令安装
	
	$ pacstrap /mnt base linux linux-firmware	#最少安装
	$ pacstrap /mnt base linux linux-firmware git vim amd-ucode

## 生成fstab文件
	genfstab -U /mnt >> /mnt/etc/fstab

## chroot到新系统
	arch-chroot /mnt
	
## 修改文件
	vim /etc/mkinitcpio.conf

	在DULES=(btrfs)	\\因为我们使用btrfs，maybe

## mkinitcpio
	mkinitcpio -p linux \\因为我们安装的是linxu内核，不知到这个命令是干啥的，反正是个重要的

## 设置时区
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
	
	将系统时钟设置为硬件失踪-并更行/etc/adjtime 中的时间戳	#看是否需要，双系统也许需要额外设置
	$ hwclock --systohc
	
	
