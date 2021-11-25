

无线中继
![image](https://raw.githubusercontent.com/mengzhihoing/vps/master/屏幕快照 2017-01-01 上午2.13.31.png)  
  
wordpress安装插件提示需要ftp账号和密码解决
原创 2017年09月28日 20:11:47 标签：wordpress /插件 /ftp /密码 /账户 133
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

padavan 允许端口通过防火墙
```
 iptables -t filter -I INPUT -p tcp --dport $ssserver_port -j ACCEPT                                 
 iptables -t filter -I INPUT -p udp --dport $ssserver_port -j ACCEPT 
```

Aj736hs6@gmail.com    lymankimberly068 agxcf64h7@yahoo.com (754) 216-8163

nginx 配置
```
server {
       listen 80;
       listen [::]:80;

       server_name sh.xuanyuanhuangdi.org;

       root /home/www/sh.xuanyuanhuangdi.org;
       index index.html;

       location / {
               try_files $uri $uri/ =404;
       }
}

server
    {
        listen 443 ssl;  # 1.1版本后这样写
        server_name sh.xuanyuanhuangdi.org; #填写绑定证书的域名
        ssl_certificate   /root/.acme.sh/sh.xuanyuanhuangdi.org/sh.xuanyuanhuangdi.org.cer;
        ssl_certificate_key   /root/.acme.sh/sh.xuanyuanhuangdi.org/sh.xuanyuanhuangdi.org.key;
        ssl_session_timeout 5m;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2; #按照这个协议配置
        ssl_ciphers ECDHE-RSA-AES128-GCM-SHA256:HIGH:!aNULL:!MD5:!RC4:!DHE;#按 $
        ssl_prefer_server_ciphers on;

        root /home/www/sh.xuanyuanhuangdi.org;

        location /shenfu1991 { #/ray提供流量重定向功能，匹配转发翻墙流量，客户 $
            proxy_redirect off;
            proxy_pass http://127.0.0.1:8765;#翻墙流量转发给10000端口，v2ray配 $
            proxy_http_version 1.1;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "upgrade";
            proxy_set_header Host $http_host;
       }

        access_log off;
    }


```

App 在macOS Catalina下提示已损坏无法打开解决办法：

打开终端；
输入以下命令，回车；

```
sudo xattr -d com.apple.quarantine /Applications/xxxx.app

```
注意：/Applications/xxxx.app 换成你的App路径
重启App即可。

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
</pre>

m1 cocoapods
For users with Macports instead Homebrew this helped me:
<pre>
sudo port install ruby27
sudo port select --set ruby ruby27
sudo gem update
sudo gem install ffi
sudo gem install cocoapods
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
