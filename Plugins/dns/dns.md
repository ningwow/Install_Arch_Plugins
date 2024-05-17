
#### 使用dhcpcd自动生成dns配置文件

#### 在使用clash的dns劫持服务时为使用tun模式，关闭系统dns服务


#### 在/etc/dhcpcd.conf中配置以下
echo "#禁用钩子停止覆盖dns,resolv.conf" >> /etc/dhcpcd.conf
echo "#nohook resolv.conf" >> /etc/dhcpcd.conf
echo "#指定静态dns地址" >> /etc/dhcpcd.conf
echo "static domain_name_servers=8.8.8.8 114.114.114.114 223.5.5.5" >> /etc/dhcpcd.conf


# 配置使用dnsmasq作为dns解析器
要配置 `dnsmasq` 作为系统的 DNS 解析器，可以按照以下步骤进行设置：

### 安装 `dnsmasq`

首先，确保 `dnsmasq` 已经安装：

```bash
sudo pacman -S dnsmasq
```

### 配置 `dnsmasq`

编辑 `dnsmasq` 的配置文件 `/etc/dnsmasq.conf`。你可以使用以下命令来编辑该文件：

```bash
sudo nano /etc/dnsmasq.conf
```

在配置文件中，添加或修改以下内容：

```ini
# 监听本地回环地址和本地网络接口
listen-address=127.0.0.1

# 你可以添加更多的配置，根据需要定制
# 例如指定上游DNS服务器（已在下方指定文件，这里不再指定）
#server=8.8.8.8
#server=8.8.4.4

# 缓存设置
cache-size=1000
# 指定上游dns服务器地址文件
resolv-file=/etc/resolv.conf
```

### 停止并禁用 `systemd-resolved`

如果 `systemd-resolved` 正在运行，可能会与 `dnsmasq` 冲突。你需要停止并禁用 `systemd-resolved`：

```bash
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
```

### 设置 `resolv.conf`

由于 `systemd-resolved` 通常管理 `/etc/resolv.conf`，你需要确保该文件指向 `dnsmasq`。首先，备份当前的 `resolv.conf` 文件：

```bash
sudo mv /etc/resolv.conf /etc/resolv.conf.backup
```

然后创建一个新的 `resolv.conf` 文件，指向 `dnsmasq`：

```bash
echo -e "nameserver 223.5.5.5\nnameserver 8.8.8.8" > /etc/resolv.conf

# echo "nameserver 223.5.5.5" | sudo tee /etc/resolv.conf
```

### 启动并启用 `dnsmasq`

启动 `dnsmasq` 服务并确保它会在系统启动时自动启动：

```bash
sudo systemctl start dnsmasq
sudo systemctl enable dnsmasq
```

### 验证配置

确保 `dnsmasq` 正常运行，并验证 DNS 解析是否通过 `dnsmasq`：

```bash
systemctl status dnsmasq
```

测试 DNS 解析：

```bash
nslookup example.com
```

输出中应该显示使用 `127.0.0.1` 作为 DNS 服务器。

### 配置 NetworkManager 使用 `dnsmasq`（可选）

如果你使用 NetworkManager 来管理网络连接，你可以配置它使用 `dnsmasq` 作为 DNS 解析器。编辑 NetworkManager 的配置文件：

```bash
sudo nano /etc/NetworkManager/NetworkManager.conf
```

在 `[main]` 部分添加或修改以下内容：

```ini
[main]
dns=dnsmasq
```

重启 NetworkManager 以应用更改：

```bash
sudo systemctl restart NetworkManager
```

通过这些步骤，你已经成功配置了 `dnsmasq` 作为系统的 DNS 解析器。现在所有的 DNS 查询都会通过 `dnsmasq` 处理。