

无线中继
![image](https://raw.githubusercontent.com/mengzhihoing/vps/master/屏幕快照 2017-01-01 上午2.13.31.png)  
  
###virmach   
  <pre>  
  190100640099 534534
  
  gongji 167485957205
  
  长效6.5折优惠码：LEB35

长效7折优惠码：LEB30

zhujiceping15，终身8.5折，全场VPS均可使用，包括特价版本

zhujiceping25，终身7.5折，特价版VPS不可用。
</pre>  

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


1.zip命令
```
zip -r myfile.zip ./*
```
将当前目录下的所有文件和文件夹全部压缩成myfile.zip文件,－r表示递归压缩子目录下所有文件.

2.unzip命令
```
unzip -o -d /home/sunny myfile.zip
```
把myfile.zip文件解压到 /home/sunny/
-o:不提示的情况下覆盖文件；
-d:-d /home/sunny 指明将文件解压缩到/home/sunny目录下；

强制https
```
rewrite ^(.*)$  https://$host$1 permanent;
```


#linux 环境变量

 一般来说，配置交叉编译工具链的时候需要指定编译工具的路径，此时就需要设置环境变量。例如我的mips-linux-gcc编译器在“/opt/au1200_rm /build_tools/bin”目录下，build_tools就是我的编译工具，则有如下三种方法来设置环境变量：

1、直接用export命令：
```
export PATH=$PATH:/opt/au1200_rm/build_tools/bin
```

例子 swift 路径：找到swift可执行路径 /usr/swift-4.2.4-RELEASE-ubuntu16.04/usr/bin
结果为
```
export PATH=$PATH:/usr/swift-4.2.4-RELEASE-ubuntu16.04/usr/bin
```

修改profile文件：
```
vi /etc/profile
```

加入 
```
export PATH=$PATH:/usr/swift-4.2.4-RELEASE-ubuntu16.04/usr/bin
```

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

v2ray 透明代理

```
{
  "log": {
    "error": "/tmp/syslog.log",
    "loglevel": "warning"
  },
  "inbounds":[
    {
      "port": 1088,
      "listen": "192.168.123.1",
      "protocol": "http",
      "settings": {
        "auth": "noauth",
        "udp": true,
        "ip": "192.168.123.1"
      },
      "streamSettings": {
        "sockopt": {
          "mark": 255
        }
      }
    },{
    //inboundDetour
      "port": "1099",
      "listen": "0.0.0.0",
      "protocol": "dokodemo-door",
      "settings": {
        "network": "tcp,udp",
        "timeout": 30,
        "followRedirect": true
      }
    }
  ],
  "outbounds":[
  {
    "protocol": "vmess",
    "settings": {
      "vnext": [
        {
          "address": "107.172.104.202",
          "port": 31364,
          "users": [
            {
              "id": "48fa8a1d-bb83-4b63-9e05-e2ca9f964411",
              "alterId": 32
            }
          ]
        }
      ]
    },
    "streamSettings": {
      "sockopt": {
        "mark": 255
      },
      "network": "tcp",
      "tcpSettings": {
        "connectionReuse": true,
        "header": {
          "type": "http",
          "request": {
            "version": "1.1",
            "method": "GET",
            "path": ["/"],
            "headers": {
              "Host": ["www.163.com", "www.sogou.com"],
              "User-Agent": [
                "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36",
                        "Mozilla/5.0 (iPhone; CPU iPhone OS 12_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) CriOS/69.0.3497.91 Mobile/15E148 Safari/605.1"
              ],
              "Accept-Encoding": ["gzip, deflate"],
              "Connection": ["keep-alive"],
              "Pragma": "no-cache"
            }
          },
          "response": {
            "version": "1.1",
            "status": "200",
            "reason": "OK",
            "headers": {
              "Content-Type": ["application/octet-stream", "application/x-msdownload", "text/html", "application/x-shockwave-flash"],
              "Transfer-Encoding": ["chunked"],
              "Connection": ["keep-alive"],
              "Pragma": "no-cache"
            }
          }
        }
      }
    }
  },{
  //outboundDetour
    "protocol": "freedom",
    "settings": {},
    "tag": "direct",
    "streamSettings": {
      "sockopt": {
        "mark": 255
      }
    }
  },{
  //outboundDetour
    "protocol": "blackhole",
    "settings": {},
    "tag": "blocked"
 }
  ],
  "dns": {
    "servers": [
      "8.8.8.8",
      "8.8.4.4",
      "localhost"
    ]
  },
  "routing": {
    "strategy": "rules",
    "settings": {
      "rules": [
        {
          "type": "field",
          "ip": [
            "127.0.0.0/8",
            "::1/128"
          ],
          "outboundTag": "blocked"
        },
        {
          "type": "field",
          "domain": [
            "baidu.com",
            "qq.com",
            "geosite:cn"
          ],
          "outboundTag": "direct"
        },
        {
          "type": "field",
          "ip": [
            "geoip:private",
            "geoip:cn",
            "100.100.100.100/32",
            "188.188.188.188/32",
            "110.110.110.110/32"
          ],
          "outboundTag": "direct"
        }
      ]
    }
  }
}


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
