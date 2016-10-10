net speeder加速
wget --no-check-certificate https://gist.github.com/LazyZhu/dc3f2f84c336a08fd6a5/raw/d8aa4bcf955409e28a262ccf52921a65fe49da99/net_speeder_lazyinstall.sh
sh net_speeder_lazyinstall.sh
nohup /usr/local/net_speeder/net_speeder venet0 "ip" >/dev/null 2>&1 &

Shadowsocks安装

wget http://mirrors.linuxeye.com/oneinstack.tar.gz
tar xzf oneinstack.tar.gz
cd oneinstack
./shadowsocks.sh install

添加用户
./shadowsocks.sh adduser

Shadowsocks卸载
./shadowsocks.sh uninstall

Shadowsocks服务管理
service shadowsocks start      #启动

service shadowsocks stop      #关闭

service shadowsocks restart   #重启

service shadowsocks status    #状态

finalspeed
一键安装，一键脚本非常方便，我在debian7上安装很顺利
rm -f install_fs.sh
wget --no-check-certificate https://github.com/dupontjoy/customization/raw/master/Rules/Shadowsocks/Finalspeed/install_fs.sh
chmod +x install_fs.sh
./install_fs.sh 2>&1 | tee install.log

卸载
sh /fs/stop.sh ;
 rm -rf /fs

启动
sh /fs/start.sh; tail -f /fs/server.log

设置开机启动
chmod +x /etc/rc.local
vi /etc/rc.local
加入
sh /fs/start.sh

锐速
 wget --no-check-certificate  https://raw.githubusercontent.com/91yun/serverspeeder/master/serverspeeder-all.sh && bash serverspeeder-all.sh

centos6.5  选7  996


SSR

wget -N --no-check-certificate https://raw.githubusercontent.com/mengzhihoing/vps/master/shadowsocksR.sh && bash shadowsocksR.sh
启动：/etc/init.d/shadowsocks start
停止：/etc/init.d/shadowsocks stop
重启：/etc/init.d/shadowsocks restart
状态：/etc/init.d/shadowsocks status
卸载：./shadowsocksR.sh uninstall
配置文件路径：/etc/shadowsocks.json
日志文件路径：/var/log/shadowsocks.log
安装路径：/usr/local/shadowsocks/shadowsoks


查看占用
lsof -i:80
kcptun 
wget https://github.com/xtaci/kcptun/releases/download/v20160922/kcptun-linux-amd64-20160922.tar.gz
tar zxvf kcptun-linux-amd64-20160922.tar.gz

./server_linux_amd64 -l ":554" -t "127.0.0.1:9999" -mtu 1400 -sndwnd 2048 -rcvwnd 2048 -mode fast2  -key gouzhongzhudi -crypt aes-128


运行

client_windows_amd64.exe -l "127.0.0.1:8388" -r "ngrokd.ml:554" -mtu 1400 -sndwnd 256 -rcvwnd 2048 -mode fast2 -key gouzhongzhudi -crypt aes-128


shadowsocks-go


wget --no-check-certificate https://raw.githubusercontent.com/iMeiji/shadowsocks_install/master/shadowsocks-go.sh
chmod +x shadowsocks-go.sh
./shadowsocks-go.sh 2>&1 | tee shadowsocks-go.log

卸载方法：
./shadowsocks-go.sh uninstall
启动：/etc/init.d/shadowsocks start
停止：/etc/init.d/shadowsocks stop
重启：/etc/init.d/shadowsocks restart
状态：/etc/init.d/shadowsocks status

配置文件路径：vi /etc/shadowsocks/config.json

{
    "server":"0.0.0.0",
    "server_port":9999,
    "local_port":1080,
    "password":"shenfu1991",
    "method":"aes-256-cfb",
    "timeout":600
}

{
    "port_password": {
        "9999": "shenfu1991",
        "8888": "shenfu1991",
        "7777": "shenfu1991",
        "6666": "shenfu1991",
        "5555": "shenfu1991",
        "4444": "shenfu1991",
        "3333": "shenfu1991",
        "2222": "shenfu1991",
        "1111": "shenfu1991"
    },
    "method": "aes-256-cfb",
    "timeout": 600
}






EjfSX7y45sjo1J22QL  
https://vpscp.alpharacks.com:5656/login.php
vmuser7647
RNsV1wnJwH
