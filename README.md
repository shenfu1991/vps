

finalspeed
一键安装，一键脚本非常方便，我在debian7上安装很顺利
<pre>
rm -f install_fs.sh  
wget --no-check-certificate https://github.com/dupontjoy/customization/raw/master/Rules/Shadowsocks/Finalspeed/install_fs.sh  
chmod +x install_fs.sh  
./install_fs.sh 2>&1 | tee install.log  

</pre>

卸载
<pre>
sh /fs/stop.sh ;    
rm -rf /fs  
 </pre>

启动
<pre>  
sh /fs/start.sh; tail -f /fs/server.log
</pre>  

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

SSR  
<pre>
wget -N --no-check-certificate https://raw.githubusercontent.com/mengzhihoing/vps/master/shadowsocksR.sh && bash shadowsocksR.sh  
</pre>

<pre>
启动：/etc/init.d/shadowsocks start   
停止：/etc/init.d/shadowsocks stop  
重启：/etc/init.d/shadowsocks restart  
状态：/etc/init.d/shadowsocks status  
卸载：./shadowsocksR.sh uninstall  
配置文件路径：/etc/shadowsocks.json  
日志文件路径：/var/log/shadowsocks.log  
安装路径：/usr/local/shadowsocks/shadowsoks  
</pre>

原版shadowsocks
<pre>
wget -N --no-check-certificate https://raw.githubusercontent.com/mengzhihoing/vps/master/shadowsocks.sh
chmod +x shadowsocks.sh
./shadowsocks.sh 2>&1 | tee shadowsocks.log
</pre>

使用命令：
<pre>
启动：/etc/init.d/shadowsocks start
停止：/etc/init.d/shadowsocks stop
重启：/etc/init.d/shadowsocks restart
状态：/etc/init.d/shadowsocks status
配置文件路径：/etc/shadowsocks.json
</pre>


查看占用  
<pre>
lsof -i:80    
</pre>


###kcptun     
<pre>
wget https://github.com/xtaci/kcptun/releases/download/v20161009/kcptun-linux-amd64-20161009.tar.gz   
tar zxvf kcptun-linux-amd64-20161009.tar.gz   
</pre>

服务器启动：   
<pre>
#./server_linux_amd64 -l ":554" -t "127.0.0.1:9999" -mtu 1400 -sndwnd 2048 -rcvwnd 2048 -mode fast3  -key shenfu1991 -crypt aes-128 
</pre>

客户端程序：  
<pre>
macOS:  https://github.com/xtaci/kcptun/releases/download/v20161009/kcptun-darwin-amd64-20161009.tar.gz    
windows:  https://github.com/xtaci/kcptun/releases/download/v20161009/kcptun-windows-amd64-20161009.tar.gz  
</pre>

客户端运行：  
<pre>
client_windows_amd64.exe -l "127.0.0.1:8388" -r "virmach.cf:554" -mtu  1400 -sndwnd 2048 -rcvwnd 2048 -mode fast3  -key shenfu1991 -crypt aes-128
</pre>

vps测试
<pre>
wget -qO- bench.sh | bash  
</pre>

老毛子固件kcptun设置：  

![image](https://raw.githubusercontent.com/mengzhihoing/vps/master/1.png)  
![image](https://raw.githubusercontent.com/mengzhihoing/vps/master/2.png)  
![image](https://raw.githubusercontent.com/mengzhihoing/vps/master/3.png)  

 



PiUd7zO5E274yL8miK
https://vpscp.alpharacks.com:5656/login.php
vmuser7647
RNsV1wnJwH
https://panel.cloudatcost.com/login.php
a7e2YzAByp

#ubuntu安装shadowsocks

用PIP安装很简单

    sudo apt-get install python-pip

接着安装shadowsocks

    sudo pip install shadowsocks



通过以上命令安装shadowsocks，为了避免权限不够，在命令行前加上sudo



启动SS服务端

在任意目录下创建  shadowsocks.json 文件，将下面的内容放进去：
 <pre>  
 {
     "server":"my_server_ip",
     "server_port":8388,
     "local_address": "127.0.0.1",
     "local_port":1080,
     "password":"mypassword",
     "timeout":300,
     "method":"aes-256-cfb",
     "fast_open": false,
     "workers": 1
     } 
     
     </pre>

每个字段的的解释：
server   服务端监听的地址，服务端可填写 0.0.0.0
server_port     服务器的端口(只要不与现有的端口冲突，随你填写了，我填8137)
local_address     本地监听的地址，直接写127.0.0.1
local_port     本地的端口，随便写，只要不冲突，我填的是1345
password     你的shadowsocks连接密码
timeout     超时时间，单位秒
method     加密方式。默认是: "aes-256-cfb", 详见：see https://github.com/clowwindy/shadowsocks/wiki/Encryption
workers    应该是进程数，这个我没该，大家可以改后看看进程是否增多。不理解的化，就别改了，这个参数只有unix/linux下可用。

然后启动运行 shadowsocks服务器端：

    ssserver -c /etc/shadowsocks.json

启动SS客户端

前两步很简单，可是有人就纳闷了安装好了不知道怎么用，其实可以用sslocal -help来查看帮助就知道了。

    sslocal -s server_ip -p server_port  -l 1080 -k password -t 600 -m aes-256-cfb

-s表示服务IP, -p指的是服务端的端口，-l是本地端口默认是1080（可以替换成任何端口号，只需保证端口不冲突）, -k 是密码（要加""）, -t超时默认300,-m是加密方法默认aes-256-cfb，

可以简单的写为：sslocal -s ip  -p  port -k "password"    #用-s -p -k这三个参数就好，其他的默认将服务端的加密方法设为aes-256-cfb。然后就可以启动代理。

现在试试打开你的终端，输入sslocal -s 服务端IP  -p  1080 -k "密码" 回车

可以将以上命令写入一个sh文件中，以后每次运行一下脚本就可以   

  



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


###LEDE 安装shadowsock ChinaDNS

https://cokebar.info/archives/664

首次安装的话，先确保路由器联网，并更新软件包列表：

注：部分ISP访问LEDE / OpenWrt官方站点可能会非常缓慢甚至下载失败，此时需要自行在PC上下载上面的依赖包以后自行上传至路由器目录手动安装。

    opkg update
    
首先，需要手动安装部分依赖包（并不是所有的依赖包，部分依赖包会自动从软件仓库安装） 
  <pre>  opkg install ip-full ipset iptables-mod-tproxy libev libpthread libpcre libmbedtls </pre>
接下来下载软件，注意需要根据自己的CPU型号来进行选择。

下载地址： http://openwrt-dist.sourceforge.net/packages/LEDE/

需要下载的文件：


    libudns_x.xx-x_xxxx.ipk
    libsodium_x.x.xx-x_xxxx.ipk
    shadowsocks-libev_x.x.x-x_xxxx.ipk
    dns-forwarder_x.x.x-x_xxxx.ipk
    ChinaDNS_x.x.x-x_xxxx.ipk
    luci-app-shadowsocks_x.x.x-x_all.ipk
    luci-app-chinadns_x.x.x-x_all.ipk
    luci-app-dns-forwarder_x.x.x-x_all.ipk


安装shadowsocks, ChinaDNS以及dns-forwarder：

<pre>
   cd /tmp
   opkg install libudns*.ipk libsodium*.ipk
   opkg install shadowsocks-libev*.ipk luci-app-shadowsocks*.ipk
   opkg install ChinaDNS*.ipk luci-app-chinadns*.ipk
   opkg install dns-forwarder*.ipk luci-app-dns-forwarder*.ipk

</pre>
  
kcptun openwrt 客户端执行文件：https://github.com/bettermanbao/openwrt-kcptun/releases  
kcptun luci界面 https://github.com/kuoruan/luci-app-kcptun/

shadowsocks ADED
```
wget --no-check-certificate -O shadowsocks-all.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks-all.sh
chmod +x shadowsocks-all.sh
./shadowsocks-all.sh 2>&1 | tee shadowsocks-all.log
```

各版本默认配置文件
Shadowsocks-Python 版：
/etc/shadowsocks-python/config.json

ShadowsocksR 版：
/etc/shadowsocks-r/config.json

Shadowsocks-Go 版：
/etc/shadowsocks-go/config.json

Shadowsocks-libev 版：
/etc/shadowsocks-libev/config.json

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
