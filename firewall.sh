#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#===============================================================================================
#   System Required:  CentOS, Debian, Ubuntu
#   Description: One click Install Shadowsocks-go server
#   Author: Teddysun <i@teddysun.com>
#   Thanks: @cyfdecyf <https://twitter.com/cyfdecyf>
#   Intro:  http://teddysun.com/392.html
#===============================================================================================

clear
echo ""
echo "#############################################################"
echo "# One click Install Shadowsocks-go server                   #"
echo "# Intro: http://teddysun.com/392.html                       #"
echo "# Author: Teddysun <i@teddysun.com>                         #"
echo "# Thanks: @cyfdecyf <https://twitter.com/cyfdecyf>          #"
echo "#############################################################"
echo ""

# Make sure only root can run our script
function rootness(){
                iptables -I INPUT -m state --state NEW -m udp -p udp --dport 9999 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 8888 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m udp -p udp --dport 8888 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 7777 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m udp -p udp --dport 7777 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 6666 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m udp -p udp --dport 6666 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 5555 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m udp -p udp --dport 5555 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 4444 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m udp -p udp --dport 4444 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 3333 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m udp -p udp --dport 3333 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 2222 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m udp -p udp --dport 2222 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 1111 -j ACCEPT
                iptables -I INPUT -m state --state NEW -m udp -p udp --dport 1111 -j ACCEPT
          echo "complete"

}             
             
             
               
