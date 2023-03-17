#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : JsPhantom
# (C) Copyright 2023
# =========================================
###########- COLOR CODE -##############
colornow=$(cat /etc/JsPhantom/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m" 
export COLOR1="$(cat /etc/JsPhantom/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/JsPhantom/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')" 
WH='\033[1;37m'                   
# // Export Color & Information
export WH='\033[1;37m'                   
export RED='\033[0;31m'
export GRN='\033[0;32m'
export YLW='\033[0;33m'
export BLU='\033[0;34m'
export PLE='\033[0;35m'
export CYA='\033[0;36m'
export LHT='\033[0;37m'
export NC='\033[0m'
clear
echo -e "${COLOR1}╔════════════════════════════════════════════╗\033[0m"
echo -e "${COLOR1}║                ${WH} ${bold}DNS Changer                $COLOR1║\033[0m"
echo -e "${COLOR1}╚════════════════════════════════════════════╝\033[0m"
dnsfile="/root/dns"
if test -f "$dnsfile"; then
udns=$(cat /root/dns)
echo -e ""
echo -e "   Active DNS : \033[1;37m$udns\033[0m"
fi
 echo -e "${NC}${WH}[${COLOR1}01${WH}]${COLOR1}• ${WH}${bold}Temporary DNS\033[0m"
 echo -e "${NC}${WH}[${COLOR1}02${WH}]${COLOR1}• ${WH}${bold}Permanent DNS\033[0m"
 echo -e "${NC}${WH}[${COLOR1}03${WH}]${COLOR1}• ${WH}${bold}Reset DNS To Default\033[0m"
 echo -e "${NC}${WH}[${COLOR1}00${WH}]${COLOR1}• ${bold}Back To Menu\033[0m"
echo ""
echo -e "${COLOR1}Press [ Ctrl+C ] • To-Exit-Script\033[0m"
echo ""
read -p "Select From Options [ 1 - 4 ] :  " dns
echo -e ""
case $dns in
1)
clear
echo -e "\033[1;37mTemporary DNS - Back To Default DNS After Rebooting VPS\033[0m"
echo ""
read -p "Please Insert DNS : " dns1
if [ -z $dns1 ]; then
echo ""
echo "Please Insert DNS !"
sleep 1
clear
dns
fi
rm /etc/resolv.conf
touch /etc/resolv.conf
echo "$dns1" > /root/dns
echo "nameserver $dns1" >> /etc/resolv.conf
systemctl restart resolvconf.service
echo ""
echo -e "\e[032;1mDNS $dns1 sucessfully insert in VPS\e[0m"
echo ""
cat /etc/resolv.conf
sleep 1
clear
dns
;;
2)
clear
echo ""
read -p "Please Insert DNS : " dns2
if [ -z $dns2 ]; then
echo ""
echo "Please Insert DNS !"
sleep 1
clear
dns
fi
rm /etc/resolv.conf
rm /etc/resolvconf/resolv.conf.d/head
touch /etc/resolv.conf
touch /etc/resolvconf/resolv.conf.d/head
echo "$dns2" > /root/dns
echo "nameserver $dns2" >> /etc/resolv.conf
echo "nameserver $dns2" >> /etc/resolvconf/resolv.conf.d/head
systemctl restart resolvconf.service
echo ""
echo -e "\e[032;1mDNS $dns2 sucessfully insert in VPS\e[0m"
echo ""
cat /etc/resolvconf/resolv.conf.d/head
sleep 1
clear
dns
;;
3)
clear
echo ""
read -p "Reset To Default DNS [Y/N]: " -e answer
if [ "$answer" = 'y' ] || [ "$answer" = 'Y' ]; then
rm /root/dns
echo ""
echo -e "[ ${G}INFO${NC} ] Delete Resolv.conf DNS"
echo "nameserver 8.8.8.8" > /etc/resolv.conf
sleep 1
echo -e "[ ${G}INFO${NC} ] Delete Resolv.conf.d/head DNS"
echo "nameserver 8.8.8.8" > /etc/resolvconf/resolv.conf.d/head
sleep 1
else if [ "$answer" = 'n' ] || [ "$answer" = 'N' ]; then
echo -e ""
echo -e "[ ${G}INFO${NC} ] Operation Cancelled By User"
sleep 1
fi
fi
clear
dns
;;
0 | 00 )
clear
menu-other
;;
*)
echo "Please enter an correct number"
clear
dns
;;
esac