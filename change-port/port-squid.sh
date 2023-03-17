#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
clear
# Valid Script
VALIDITY () {
    today=`date -d "0 days" +"%Y-%m-%d"`
    Exp1=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | grep $MYIP | awk '{print $4}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mYOUR SCRIPT ACTIVE..\e[0m"
    else
    echo -e "\e[31mYOUR SCRIPT HAS EXPIRED!\e[0m";
    echo -e "\e[31mPlease renew your ipvps first\e[0m"
    exit 0
fi
}
IZIN=$(curl https://raw.githubusercontent.com/${GitUser}/allow/main/ipvps.conf | awk '{print $5}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
VALIDITY
else
echo -e "\e[31mPermission Denied!\e[0m";
echo -e "\e[31mPlease buy script first\e[0m"
exit 0
fi
echo -e "\e[32mloading...\e[0m"
clear
sqd="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | head -n1)"
sqd2="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}' | tail -n1)"
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                 \e[$box CHANGE PORT SQUID\\e[30m                   \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "  [\e[$number 01${NC}]\e[$below • Change Port $sqd\e[m"
echo -e "  [\e[$number 02${NC}]\e[$below • Change Port $sqd2\e[m"
echo -e ""
echo -e "     [x]  Back To Menu Change Port"
echo -e "     [y]  Go To Main Menu"
echo -e ""
read -p "     Select From Options [1-3 or x & y] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port Squid: " squid
if [ -z $squid ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd/$squid/g" /etc/squid/squid.conf
sed -i "s/$sqd/$squid/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
echo -e "\e[032;1mPort $squid modified successfully\e[0m"
else
echo -e "\e[1;31mPort $squid is used\e[0m"
fi
;;
2)
read -p "New Port Squid: " squid
if [ -z $squid ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $squid)
if [[ -z $cek ]]; then
sed -i "s/$sqd2/$squid/g" /etc/squid/squid.conf
sed -i "s/$sqd2/$squid/g" /root/log-install.txt
/etc/init.d/squid restart > /dev/null
echo -e "\e[032;1mPort $squid modified successfully\e[0m"
else
echo -e "\e[1;31mPort $squid is used\e[0m"
fi
;;
x)
clear
change-port
;;
y)
clear
menu
;;
*)
echo "Please enter an correct number"
sleep 1
port-squid
;;
esac
