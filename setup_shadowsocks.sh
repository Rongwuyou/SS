#!/bin/bash

# 更新系统
apt update && apt upgrade -y

# 安装 ufw
apt install -y ufw

# 放行端口
ufw allow 20983
ufw enable

# 安装 Shadowsocks-libev
apt install -y shadowsocks-libev

# 创建配置文件
cat <<EOL > /etc/shadowsocks-libev/config.json
{
    "server": ["0.0.0.0"],
    "mode": "tcp_and_udp",
    "server_port": 20983,
    "local_port": 1080,
    "password": "f7HPfOXMbqpn",
    "timeout": 300,
    "method": "aes-256-gcm"
}
EOL

# 启动并启用服务
systemctl start shadowsocks-libev
systemctl enable shadowsocks-libev

echo "Shadowsocks-libev 安装并配置完成！"
