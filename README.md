

设置开机启动
<pre>
chmod +x /etc/rc.local  
vi /etc/rc.local  
加入  
sh /fs/start.sh  
</pre>

定时重启  
<pre>
crontab -e
0 3 * * * reboot
</pre>

锐速
<pre>
 wget --no-check-certificate  https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh && bash serverspeeder-all.sh  
</pre>  
 

<pre> 
启动锐速：/serverspeeder/bin/serverSpeeder.sh start
停止锐速：/serverspeeder/bin/serverSpeeder.sh stop
锐速状态：service serverSpeeder status
重启锐速：/serverspeeder/bin/serverSpeeder.sh restart
锐速配置：/serverspeeder/etc/config
卸载锐速：/serverspeeder/bin/serverSpeeder.sh uninstall
</pre>

查看占用  
<pre>
lsof -i:80    
</pre>


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




shadowsocks ADED
```
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log
```

Shadowsocks-Python 版：
/etc/init.d/shadowsocks-python start | stop | restart | status

ShadowsocksR 版：
/etc/init.d/shadowsocks-r start | stop | restart | status

Shadowsocks-Go 版：
/etc/init.d/shadowsocks-go start | stop | restart | status

Shadowsocks-libev 版：
/etc/init.d/shadowsocks-libev start | stop | restart | status

各版本默认配置文件
Shadowsocks-Python 版：
/etc/shadowsocks-python/config.json

ShadowsocksR 版：
/etc/shadowsocks-r/config.json

Shadowsocks-Go 版：
/etc/shadowsocks-go/config.json

Shadowsocks-libev 版：
/etc/shadowsocks-libev/config.json



魔改BBR
```
wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh

```

梅林ss
```
cd /tmp
wget --no-check-certificate https://raw.githubusercontent.com/koolshare/koolshare.github.io/acelan_softcenter_ui/shadowsocks/shadowsocks.tar.gz
tar -zxvf /tmp/shadowsocks.tar.gz
chmod +x /tmp/shadowsocks/install.sh
sh /tmp/shadowsocks/install.sh
```

利用scp传输文件

  1、从服务器下载文件
  scp username@servername:/path/filename /tmp/local_destination
  例如scp codinglog@192.168.0.101:/home/kimi/test.txt  把192.168.0.101上的/home/kimi/test.txt
  的文件下载到 /tmp/local_destination



   2、上传本地文件到服务器
  scp /path/local_filename username@servername:/path  
  例如scp /var/www/test.php  codinglog@192.168.0.101:/var/www/  把本机/var/www/目录下的test.php文件
  上传到192.168.0.101这台服务器上的/var/www/目录中
  
  3、从服务器下载整个目录
      scp -r username@servername:remote_dir/ /tmp/local_dir 
    例如:scp -r codinglog@192.168.0.101 /home/kimi/test  /tmp/local_dir
  
  4、上传目录到服务器
      scp  -r /tmp/local_dir username@servername:remote_dir
      例如：
      scp -r test      codinglog@192.168.0.101:/var/www/   把当前目录下的test目录上传到服务器
      的/var/www/ 目录
      
    
CN2路线
```
http://www.vpscang.com/?vps_special_route=cn2
```

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
