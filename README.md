

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

锐速
<pre>
 wget --no-check-certificate  https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh && bash serverspeeder-all.sh  
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
./server_linux_amd64 -l ":554" -t "127.0.0.1:9999" -mtu 1400 -sndwnd 2048 -rcvwnd 2048 -mode fast2  -key gouzhongzhudi -crypt aes-128    
</pre>

客户端程序：  
<pre>
macOS:  https://github.com/xtaci/kcptun/releases/download/v20161009/kcptun-darwin-amd64-20161009.tar.gz    
windows:  https://github.com/xtaci/kcptun/releases/download/v20161009/kcptun-windows-amd64-20161009.tar.gz  
</pre>

客户端运行：  
<pre>
client_windows_amd64.exe -l "127.0.0.1:8388" -r "ngrokd.ml:554" -mtu 1400 -sndwnd 2048 -rcvwnd 2048 -mode fast2  -key gouzhongzhudi -crypt aes-128   
</pre>


vps测试
<pre>
wget -qO- bench.sh | bash  
</pre>



老毛子固件kcptun设置：  

![image](https://raw.githubusercontent.com/mengzhihoing/vps/master/1.png)  
![image](https://raw.githubusercontent.com/mengzhihoing/vps/master/2.png)  
![image](https://raw.githubusercontent.com/mengzhihoing/vps/master/3.png)  

 



67HBFA099I2xodEwyo  
https://vpscp.alpharacks.com:5656/login.php
vmuser7647
RNsV1wnJwH
