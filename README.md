


wordpress安装插件提示需要ftp账号和密码解决
      在wordpress安装之后，想要安装一个插件来用，结果提示输入ftp账户与密码，而我本人根本不记得什么时候设置过ftp账户与密码。最后搜索了一下网上的解决方案，所需要更改wordpress文件夹的权限，代码如下：

```
sudo chown -R www  /home/wwwroot/hi
```
后面的文件路径是自己安装wordpress时的路径。
可是按照这样操作之后，系统报错：
```
chown: changing ownership of `/home/wwwroot/hi/.user.ini': Operation not permitted
```
最后网上又找了一下解决方案，发现只需要如下更改之后就ok了：
```
sudo chown -R www  /home/wwwroot/hi/* 
```
只需要在文件路径之后再加一个/* ，具体原因对于我这种系统小白来讲也不清除，在此记录一下，希望能帮助到需要的人。


强制https
```
rewrite ^(.*)$  https://$host$1 permanent;
```


export

<pre>
export PATH=/路径/usr/bin:"${PATH}"
</pre>

<pre>
export PATH=/路径/usr/bin:$PATH
</pre>

登录后启用，在 /etc/profile 文件末尾加入

mysql 远程连接

```
GRANT ALL  PRIVILEGES ON *.* TO 'shenfu'@'124.79.91.133'IDENTIFIED BY 'shenfu1991' WITH GRANT OPTION;   
FLUSH  PRIVILEGES;
```

防火墙
```
iptables -L -n --line-numbers
iptables -D INPUT 5（3306）
```

以下命令行修改指定目录下的所有文件的权限为全体可读、可修改、可执行
```
chmod -R 777 apache-tomcat-8.5.20

```

ws+tls
```
      location /ray { #/ray提供流量重定向功能，匹配转发翻墙流量，客户端中伪装$
        proxy_redirect off;
        proxy_pass http://127.0.0.1:10000;#翻墙流量转发给10000端口，v2ray配置>$
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $http_host;
      }
```

Aj736hs6@gmail.com    lymankimberly068 agxcf64h7@yahoo.com (754) 216-8163

loid

<pre>
0773003288596699
</pre>

UBPSXXS7KCTOLVQN
5I3GT6XCEXEFXUFT

iphone 不停闪烁
<pre>
sudo killall -STOP -c usbd
</pre>

判断终端是否走代理
<pre>
curl cip.cc
</pre>


<pre>
rm: cannot remove `.user.ini‘: Operation not permitted in Linux delete file in rm-rf
</pre>
Go to the directory where `.user.ini' is located, execute lsattr -a, check the attributes of the files included under the file, and see that `.user.ini' has an'i' attribute, which means that the file or directory must not be changed arbitrarily. It is this attribute that causes:
<pre>
chattr -i .user.ini 
</pre>

davinci21s Z54FSQYC6RSRLNPY


查看文件夹大小

<pre>
du -sh ./*
</pre>


查找文件
<pre>
nano ./.config/Run.plist
./.config/Run.plist

find . -name "*.c"

find / -name +文件名

</pre>


客户端配置
如果是想让主机所有用户都生效，修改/etc/ssh/ssh_config
如果只想让本人生效，则修改 ~/.ssh/config
https://blog.phpgao.com/keep_connect_ssh.html
<pre>
Host *
    ServerAliveInterval 30
    ServerAliveCountMax 3
</pre>

ubuntu查看进程被杀死原因
代替dmesg | less，dmesg | grep -i kill可能会更有用。因此，
<pre>
grep /var/log/kern.log* -ie kill
</pre>

<pre>
journalctl -xb | egrep -i 'tx'</pre>
<pre>

修改 /etc/systemd/system/v2ray.service

Environment="V2RAY_VMESS_AEAD_FORCED=false"
增加完，重启服务即可

systemctl daemon-reload

systemctl restart v2ray
</pre>

<pre>
[Unit]
Description=V2Ray Service
Documentation=https://www.v2fly.org/
After=network.target nss-lookup.target

[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/local/bin/v2ray -config /usr/local/etc/v2ray/config.json
Restart=on-failure
RestartPreventExitStatus=23
Environment="V2RAY_VMESS_AEAD_FORCED=false"

[Install]
WantedBy=multi-user.target
</pre>



修改开机启动文件：/etc/rc.local（或者/etc/rc.d/rc.local）
创建软链接
$ sudo ln -s /lib/systemd/system/rc-local.service /etc/systemd/system/rc-local.service
重启系统 rc.local 就生效了。

<pre>
#!/bin/bash

/root/gost -L=:1080 -F=socks5://uscn.xuanyuanhuangdi.org:9119?notls=true 

export http_proxy="socks5://127.0.0.1:1080" 

export https_proxy="socks5://127.0.0.1:1080"

exit 0

</pre>

然后设置权限
<pre>
chmod +x  /etc/rc.local
chmod 755 /etc/rc.local
</pre>

Ubuntu14.04设置网络代理
buntu下apt-get的网络代理设置（终端命令行的网络代理设置）

方法一：

如果只是想临时使用http代理，可以在使用apt-get之前于终端下输入：export http_proxy="http://用户名:密码@代理IP:代理端口"

方法二：（方法一的持久化）

如果希望apt-get与其它应用程序都可以一直使用http代理，可以这样：

在终端下编辑~/.bashrc文件：　
vim ~/.bashrc

在文件末尾添加如下两句：

export http_proxy=http://用户名:密码@代理地址:代理端口
export https_proxy=http://用户名:密码@代理地址:代理端口
export no_proxy="127.0.0.1, localhost, *.cnn.com, 192.168.1.10, domain.com:8080"

然后执行下面命令，使环境变量生效
<pre>
source ~/.bashrc
</pre>


**ubuntu 修改ssh端口**

一、找到ssh配置文件位置
<pre>
vi /etc/ssh/sshd_config
</pre>

二、修改ssh登录端口号修改port22为
<pre>
port xxxx
</pre>

三、重启ssh服务
<pre>
/etc/init.d/ssh restart
</pre>


gost加认证
<pre>
 nohup /root/gost -L http://shenfu:shenfu1991@:59119 &

 nohup /root/gost -L=:18888 -F=http://shenfu:shenfu1991@uscn.xuanyuanhuangdi.org:59119 &
</pre>



**自建文件服务器**
<pre>
docker run --name oasis -t -d \
-v /opt/oasis/data:/opt/oasis/data \
-v /home/storage:/home/storage \
-p 8000:8000 machengim/oasis
</pre>

nginx 配置

在 server 的同级节点添加如下配置：
<pre>

upstream halo {
  server 127.0.0.1:8000;
}
</pre>


在 server 节点添加如下配置
<pre>
location / {
  proxy_set_header HOST $host;
  proxy_set_header X-Forwarded-Proto $scheme;
  proxy_set_header X-Real-IP $remote_addr;
  proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  proxy_pass http://halo;
}
</pre>

修改 location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$ 节点. 
<pre>
location ~ .*\.(gif|jpg|jpeg|png|bmp|swf|flv|mp4|ico)$ {
  proxy_pass http://halo; #增加这行
  expires 30d;
  access_log off;
 }
</pre>

修改 location ~ .*\.(js|css)?$ 节点
<pre>
location ~ .*\.(js|css)?$ {
  proxy_pass http://halo; #增加这行
  expires 7d;
  access_log off;
}
</pre>

 pushd: not found
<pre>
sudo dpkg-reconfigure dash
</pre>

v2
<pre>
bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh)
</pre>

查看文件夹大小
<pre>
du -h --max-depth=0 ./*
</pre>

A: 一种可能原因是经过 Nginx 反向代理，开启了 buffer，则 Nginx 会尝试从后端缓冲一定大小的数据再发送给浏览器。请尝试在反代参数后添加
<pre> proxy_buffering off; </pre>

，然后重载 Nginx。其他 web server 配置同理。

ubuntu限速

<pre>
sudo tc qdisc add dev eth0 root tbf rate 800kbit burst 16kbit latency 50ms

sudo tc qdisc del dev eth0 root

wget https://download.swift.org/swift-5.9.2-release/ubuntu2204/swift-5.9.2-RELEASE/swift-5.9.2-RELEASE-ubuntu22.04.tar.gz


sudo tc qdisc add dev eth0 root netem delay 100ms    

      
</pre>
