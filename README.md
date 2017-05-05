

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
/root/server_linux_amd64 -l ":554" -t "127.0.0.1:9999" -mtu 1400 -sndwnd 2048 -rcvwnd 2048 -mode fast3  -key shenfu1991 -crypt aes-128 
</pre>

客户端程序：  
<pre>
macOS:  https://github.com/xtaci/kcptun/releases/download/v20161009/kcptun-darwin-amd64-20161009.tar.gz    
windows:  https://github.com/xtaci/kcptun/releases/download/v20161009/kcptun-windows-amd64-20161009.tar.gz  
</pre>

客户端运行：  
<pre>
client_windows_amd64.exe -l "127.0.0.1:8388" -r "104.223.22.51:554" -mtu 1400 -sndwnd 512 -rcvwnd 512 -mode fast  -key shenfu1991 -crypt aes-128
client_windows_amd64.exe -l "127.0.0.1:8388" -r "104.223.22.51:554" -mtu  1400 -sndwnd 512 -rcvwnd 512 -mode fast  -key shenfu1991 -crypt aes-128
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
