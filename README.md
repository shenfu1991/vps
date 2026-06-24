# WordPress 安装插件提示需要 FTP 账号和密码的解决方法

WordPress 安装完成后，安装插件时可能会提示输入 FTP 账号和密码。通常这是因为 WordPress 目录权限不正确，需要调整站点目录的所属用户。

## 1. 修改 WordPress 目录权限

假设 WordPress 安装路径为 `/home/wwwroot/hi`，可以尝试执行：

```bash
sudo chown -R www /home/wwwroot/hi
```

如果出现以下报错：

```text
chown: changing ownership of `/home/wwwroot/hi/.user.ini': Operation not permitted
```

可以改为只修改目录内文件：

```bash
sudo chown -R www /home/wwwroot/hi/*
```

说明：`/home/wwwroot/hi` 需要替换成你自己的 WordPress 安装路径。

---

# 常用服务器运维笔记

## 强制 HTTPS

Nginx rewrite 配置：

```nginx
rewrite ^(.*)$ https://$host$1 permanent;
```

## 配置 PATH

临时或写入配置文件时可使用：

```bash
export PATH=/路径/usr/bin:"${PATH}"
```

或：

```bash
export PATH=/路径/usr/bin:$PATH
```

如需登录后自动启用，可加入 `/etc/profile` 文件末尾。

## MySQL 远程连接授权

```sql
GRANT ALL PRIVILEGES ON *.* TO 'shenfu'@'124.79.91.133' IDENTIFIED BY 'shenfu1991' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

## 防火墙规则

查看规则编号：

```bash
iptables -L -n --line-numbers
```

删除指定规则：

```bash
iptables -D INPUT 5（3306）
```

## 修改目录权限

将指定目录下所有文件设置为所有用户可读、可写、可执行：

```bash
chmod -R 777 apache-tomcat-8.5.20
```

注意：`777` 权限风险较高，生产环境应谨慎使用。

## 杂项记录

```text
Aj736hs6@gmail.com    lymankimberly068 agxcf64h7@yahoo.com (754) 216-8163
```

```text
loid
0773003288596699
```

```text
UBPSXXS7KCTOLVQN
5I3GT6XCEXEFXUFT
```

```text
davinci21s Z54FSQYC6RSRLNPY
```

## iPhone 不停闪烁

```bash
sudo killall -STOP -c usbd
```

## 判断终端是否走代理

```bash
curl cip.cc
```

## 删除 `.user.ini` 时提示 Operation not permitted

错误示例：

```text
rm: cannot remove `.user.ini': Operation not permitted
```

可能原因是文件带有不可修改属性。进入 `.user.ini` 所在目录后查看属性：

```bash
lsattr -a
```

如果 `.user.ini` 带有 `i` 属性，可以先移除该属性：

```bash
chattr -i .user.ini
```

然后再删除或修改文件。

## 查看文件夹大小

```bash
du -sh ./*
```

## 查找文件

打开指定文件：

```bash
nano ./.config/Run.plist
```

查找 C 文件：

```bash
find . -name "*.c"
```

按文件名全局查找：

```bash
find / -name "文件名"
```

## SSH 客户端保持连接

如果希望对主机所有用户生效，修改：

```text
/etc/ssh/ssh_config
```

如果只对当前用户生效，修改：

```text
~/.ssh/config
```

配置示例：

```sshconfig
Host *
    ServerAliveInterval 30
    ServerAliveCountMax 3
```

参考链接：

[SSH 保持连接](https://blog.phpgao.com/keep_connect_ssh.html)

## Ubuntu 查看进程被杀死原因

可以使用：

```bash
grep /var/log/kern.log* -ie kill
```

或：

```bash
journalctl -xb | egrep -i 'tx'
```

## 修改开机启动文件

启动文件路径通常为：

```text
/etc/rc.local
```

或：

```text
/etc/rc.d/rc.local
```

创建 systemd 软链接：

```bash
sudo ln -s /lib/systemd/system/rc-local.service /etc/systemd/system/rc-local.service
```

`/etc/rc.local` 示例：

```bash
#!/bin/bash

/root/gost -L=:1080 -F=socks5://uscn.xuanyuanhuangdi.org:9119?notls=true

export http_proxy="socks5://127.0.0.1:1080"
export https_proxy="socks5://127.0.0.1:1080"

exit 0
```

设置权限：

```bash
chmod +x /etc/rc.local
chmod 755 /etc/rc.local
```

## Ubuntu 14.04 设置网络代理

### 方法一：临时使用 HTTP 代理

```bash
export http_proxy="http://用户名:密码@代理IP:代理端口"
```

### 方法二：持久化代理配置

编辑 `~/.bashrc`：

```bash
vim ~/.bashrc
```

在文件末尾添加：

```bash
export http_proxy="http://用户名:密码@代理地址:代理端口"
export https_proxy="http://用户名:密码@代理地址:代理端口"
export no_proxy="127.0.0.1,localhost,*.cnn.com,192.168.1.10,domain.com:8080"
```

使配置生效：

```bash
source ~/.bashrc
```

## Ubuntu 修改 SSH 端口

编辑 SSH 服务端配置文件：

```bash
vi /etc/ssh/sshd_config
```

将默认端口改为需要的端口：

```sshconfig
Port xxxx
```

重启 SSH 服务：

```bash
/etc/init.d/ssh restart
```

## gost 加认证

启动带认证的 HTTP 服务：

```bash
nohup /root/gost -L http://shenfu:shenfu1991@:59119 &
```

通过上游代理转发：

```bash
nohup /root/gost -L=:18888 -F=http://shenfu:shenfu1991@uscn.xuanyuanhuangdi.org:59119 &
```

## 自建文件服务器

Docker 启动命令：

```bash
docker run --name oasis -t -d \
  -v /opt/oasis/data:/opt/oasis/data \
  -v /home/storage:/home/storage \
  -p 8000:8000 \
  machengim/oasis
```

## Nginx 反向代理配置

在 `server` 同级节点添加：

```nginx
upstream halo {
  server 127.0.0.1:8000;
}
```

在 `server` 节点添加：

```nginx
location / {
  proxy_set_header HOST $host;
  proxy_set_header X-Forwarded-Proto $scheme;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_pass http://halo;
}
```

修改 `location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$` 节点：

```nginx
location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$ {
  proxy_pass http://halo; # 增加这行
  expires 30d;
  access_log off;
}
```

修改 `location ~ .*\.(js|css)?$` 节点：

```nginx
location ~ .*\.(js|css)?$ {
  proxy_pass http://halo; # 增加这行
  expires 7d;
  access_log off;
}
```

## pushd: not found

```text
pushd: not found
```

可尝试重新配置 `dash`：

```bash
sudo dpkg-reconfigure dash
```

## v2ray

安装：

```bash
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
```

编辑服务文件：

```bash
nano /etc/systemd/system/v2ray.service
```

在 `RestartPreventExitStatus=23` 下增加：

```ini
Environment="V2RAY_VMESS_AEAD_FORCED=false"
```

增加完成后，重启服务：

```bash
systemctl daemon-reload
systemctl restart v2ray
```

## ws + tls

Nginx 配置示例：

```nginx
location /ray {
  proxy_redirect off;
  proxy_pass http://127.0.0.1:10000;
  proxy_http_version 1.1;
  proxy_set_header Upgrade $http_upgrade;
  proxy_set_header Connection "upgrade";
  proxy_set_header Host $http_host;
}
```

## 查看文件夹大小

```bash
du -h --max-depth=0 ./*
```

列出当前目录下文件夹大小：

```bash
du -h --max-depth=1
```

## Nginx 反向代理关闭 buffer

一种可能原因是经过 Nginx 反向代理时开启了 buffer，Nginx 会尝试从后端缓冲一定大小的数据再发送给浏览器。

可在反代参数后添加：

```nginx
proxy_buffering off;
```

然后重载 Nginx。其他 Web Server 配置同理。

## 姓名测试

```text
https://m.meimingteng.com/m/ceming.aspx
```

```text
http://www.gfname.com/app2/index.php
```

```text
http://ceming.taijiyu.net/CeMing.aspx
```

## 自建 RustDesk

### 下载 server

```text
https://github.com/rustdesk/rustdesk-server/releases/download/1.1.15/rustdesk-server-linux-amd64.zip
```

开放端口，国内服务器需要打开防火墙：

```bash
ufw allow 21115:21119/tcp
ufw allow 21115:21119/udp
```

### hbbs 服务

编辑：

```bash
nano /etc/systemd/system/hbbs.service
```

配置：

```ini
[Unit]
Description=RustDesk Signal Server (hbbs)
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/rustdesk
ExecStart=/root/rustdesk/hbbs
Restart=always
RestartSec=3

# 提高稳定性
LimitNOFILE=100000

# 安全隔离（可选但建议）
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
```

### hbbr 服务

编辑：

```bash
nano /etc/systemd/system/hbbr.service
```

配置：

```ini
[Unit]
Description=RustDesk Relay Server (hbbr)
After=network.target

[Service]
Type=simple
WorkingDirectory=/root/rustdesk
ExecStart=/root/rustdesk/hbbr
Restart=always
RestartSec=3

LimitNOFILE=100000
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
```

启动服务：

```bash
systemctl daemon-reexec
systemctl enable hbbs hbbr
systemctl start hbbs hbbr
```

设置开机启动：

```bash
sudo systemctl enable hbbs
sudo systemctl enable hbbr
```

注意：`id_ed25519`、`id_ed25519.pub` 都要保存。

## 一键 DD Ubuntu

```bash
curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh

bash reinstall.sh ubuntu 24.04 \
  --password '你的密码' \
  --ssh-port 22
```

## Xray

安装：

```bash
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install
```

生成配置所需信息：

```bash
xray uuid
xray x25519
```

编辑配置：

```bash
sudo nano /usr/local/etc/xray/config.json
```

配置示例：

```json
{
  "log": {
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "listen": "0.0.0.0",
      "port": 8443,
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "",
            "flow": "xtls-rprx-vision"
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "tcp",
        "security": "reality",
        "realitySettings": {
          "show": false,
          "dest": "www.microsoft.com:443",
          "xver": 0,
          "serverNames": [
            "www.microsoft.com"
          ],
          "privateKey": "",
          "shortIds": [
            "ab433c585465f802"
          ]
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
```

测试和启动：

```bash
xray run -test -config /usr/local/etc/xray/config.json

sudo systemctl restart xray
sudo systemctl enable xray
sudo systemctl status xray
```

## 共享 443 端口

SNI 分流搭建 Reality + XTLS-RPRX-Vision 操作记录。

环境说明：

```text
系统：Ubuntu/Debian
Nginx：编译安装，路径 /usr/local/nginx/
Xray：已安装，路径 /usr/local/bin/xray
目标：443 端口 SNI 分流，Reality 流量给 Xray，网站流量给 Nginx
```

确认环境：

```bash
# 确认 Nginx 有 stream 模块
nginx -V 2>&1 | grep -o 'with-stream[^ ]*'

# 查看 443 监听分布
grep -rn "listen.*443" /etc/nginx/

# 确认 Xray 状态
xray version
systemctl status xray | head -5
```

原因：apt 安装的 Nginx，stream 是动态模块，需要手动安装并加载。

### 安装并加载 stream 模块

```bash
# 第一步：安装动态模块包
apt install -y libnginx-mod-stream

# 第二步：确认模块文件存在
ls /usr/lib/nginx/modules/ | grep stream
# 应看到 ngx_stream_module.so

# 第三步：在 nginx.conf 第一行手动加载模块
sed -i '1s/^/load_module \/usr\/lib\/nginx\/modules\/ngx_stream_module.so;\n/' \
  /etc/nginx/nginx.conf

# 确认第一行正确
head -3 /etc/nginx/nginx.conf
```

### 修改网站 Nginx 配置

将网站的 443 监听改为本地 4443，每个网站配置文件都要执行：

```bash
# 替换 IPv4 监听
sed -i 's/listen 443 ssl http2;/listen 127.0.0.1:4443 ssl http2;/g' \
  /root/vhost/*.conf

# 替换 IPv6 监听（如果有）— 注意：会被替换成和上面一样，需要删掉重复行
sed -i 's/listen \[::\]:443 ssl http2;/listen 127.0.0.1:4443 ssl http2;/g' \
  /root/vhost/*.conf
```

### 在 Nginx 主配置加 stream 块

```bash
cat >> /etc/nginx/nginx.conf << 'EOF'

stream {
    map $ssl_preread_server_name $backend {
        www.microsoft.com   127.0.0.1:8443;
        default             127.0.0.1:4443;
    }

    server {
        listen 0.0.0.0:443;
        proxy_pass $backend;
        ssl_preread on;
        proxy_connect_timeout 10s;
        proxy_timeout 300s;
    }
}
EOF
```

### 修改 Xray 配置

```json
"listen": "127.0.0.1",
"port": 8443
```

重启服务：

```bash
systemctl restart xray
nginx -s reload
```

确认端口监听：

```bash
ss -tlnp | grep -E '443|4443|8443'
```

测试 SNI 分流：

```bash
# 替换为你的 VPS IP，应该返回你自己的证书
echo | openssl s_client -connect VPS_IP:443 \
  -servername 你的网站域名 2>&1 | grep "subject="

# 应返回微软的证书
echo | openssl s_client -connect VPS_IP:443 \
  -servername www.microsoft.com 2>&1 | grep "subject="
```

### apt 安装 Nginx 的完整操作顺序

```bash
# 1. 安装 stream 模块
apt install -y libnginx-mod-stream

# 2. nginx.conf 顶部加载模块
sed -i '1s/^/load_module \/usr\/lib\/nginx\/modules\/ngx_stream_module.so;\n/' \
  /etc/nginx/nginx.conf

# 3. 批量修改网站配置 443 → 4443
sed -i 's/listen 443 ssl/listen 127.0.0.1:4443 ssl/g' /etc/nginx/sites-enabled/*
sed -i 's/listen 443 ssl/listen 127.0.0.1:4443 ssl/g' /root/vhost/*.conf
# 删除重复的 IPv6 监听行（如有）
# 检查：grep -rn "listen.*443" /etc/nginx/sites-enabled/ /root/vhost/

# 4. 在 nginx.conf 末尾追加 stream 块（纯文本，不要复制带超链接的）
cat >> /etc/nginx/nginx.conf << 'EOF'

stream {
    map $ssl_preread_server_name $backend {
        www.microsoft.com   127.0.0.1:8443;
        default             127.0.0.1:4443;
    }

    server {
        listen 0.0.0.0:443;
        proxy_pass $backend;
        ssl_preread on;
        proxy_connect_timeout 10s;
        proxy_timeout 300s;
    }
}
EOF

# 5. 修改 Xray 只监听本地
sed -i 's/"listen": "0.0.0.0"/"listen": "127.0.0.1"/' \
  /usr/local/etc/xray/config.json

# 6. 验证并启动
nginx -t && systemctl restart nginx && systemctl restart xray

# 7. 确认端口
ss -tlnp | grep -E '443|4443|8443'
```

## Quan X 订阅文件格式

编辑：

```bash
nano real.conf
```

内容示例：

```text
vless=hzx1.xuanyuanhuangdi.org:8443, method=none, password=81b91428-1ce7-4c97-a38c-e504b564e45d, obfs=over-tls, obfs-host=www.microsoft.com, tls-verification=true, tls13=true, udp-relay=true, fast-open=true, reality-base64-pubkey=dCz1sHXLZIlyMLefjLRjTBxSOPNsgsv_GJgLrb8LnXY, reality-hex-shortid=aab433c585465f802, vless-flow=xtls-rprx-vision, tag=Reality
```
