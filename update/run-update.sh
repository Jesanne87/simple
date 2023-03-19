#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
echo ""
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf )
clear
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
# CEK UPDATE
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}($version)${Font_color_suffix}"
Info2="${Green_font_prefix}(LATEST VERSION)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
#Status Version
if [[ $version < $ver ]]; then
sts="${Error}"
else
sts="${Info2}"
fi
clear
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                 \e[$box CHECK NEW UPDATE\e[30m                    \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "\e[$below VERSION NOW >> $Info1"
echo -e "\e[$below STATUS UPDATE >> $sts"
echo -e ""
echo -e "       \e[1;31mWould you like to proceed?\e[0m"
echo ""
echo -e "            \e[0;32m[ Select Option ]\033[0m"
echo -e "[\e[$number 01${NC}]\e[$below • Check Script Update Now\e[m"
echo -e "[\e[$number 02${NC}]\e[$below • Back To Update Menu\e[m"
echo -e "[\e[$number 03${NC}]\e[$below • Back To Main Menu\e[m"
echo -e ""
echo -e "\e[$line--------------------------------------------------------\e[m"
echo -e "\e[$line"
read -p "Please Choose 1-3 : " option2
case $option2 in
1)
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf | grep $version )
if [ $version = $new_version ]; then
clear
echo -e "\e[1;31mChecking New Version, Please Wait...!\e[m"
sleep 3
clear
echo -e "\e[1;31mUpdate Not Available\e[m"
clear
sleep 1
echo -e "\e[1;36mYou Have The Latest Version\e[m"
echo -e "\e[1;31mThankyou.\e[0m"
sleep 2
update
fi
clear
echo -e "\e[1;31mUpdate Available Now..\e[m"
sleep 2
echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
sleep 2
clear
echo -e "\e[0;32mGetting New Version Script..\e[0m"
sleep 1
# RUN UPDATE
clear
echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 6
clear
echo -e "\e[0;32mNew Version Downloading started!\e[0m"
sleep 2
cd /usr/bin
rm -f update
rm -f run-update
rm -f message-ssh
rm -f change-port
rm -f system
rm -f menu
rm -f check-sc
rm -f certv2ray
rm -f trojaan
rm -f xray-menu
rm -f vless-menu
rm -f vmess-menu
rm -f xp
rm -f port-xray
rm -f themes
rm -f backup
rm -f restore
rm -f add-host
rm -f about
rm -f add-ssh
rm -f trial
rm -f del-ssh
rm -f member
rm -f delete
rm -f cek-ssh
rm -f restart
rm -f speedtest
rm -f info
rm -f renew-ssh
rm -f autokill
rm -f ceklim
rm -f tendang
rm -f clean-ram
rm -f port-ovpn
rm -f port-ssl
rm -f port-squid
rm -f port-websocket
rm -f user-list
rm -f user-lock
rm -f user-unlock
rm -f user-password
rm -f antitorrent
rm -f cfa
rm -f cfd
rm -f cfp
rm -f check-sc
rm -f ssh
rm -f autoreboot
rm -f port-ohp
rm -f dns
rm -f nf
wget -O update "https://raw.githubusercontent.com/${GitUser}/simple/main/update/update.sh"
wget -O run-update "https://raw.githubusercontent.com/Jesanne87/simple/main/update/run-update.sh"
wget -O message-ssh "https://raw.githubusercontent.com/${GitUser}/simple/main/update/message-ssh.sh"
wget -O change-port "https://raw.githubusercontent.com/${GitUser}/simple/main/change.sh"
wget -O system "https://raw.githubusercontent.com/${GitUser}/simple/main/menu/system.sh"
wget -O menu "https://raw.githubusercontent.com/${GitUser}/simple/main/menu.sh"
wget -O add-host "https://raw.githubusercontent.com/${GitUser}/simple/main/system/add-host.sh"
wget -O check-sc "https://raw.githubusercontent.com/${GitUser}/simple/main/system/running.sh"
wget -O certv2ray "https://raw.githubusercontent.com/${GitUser}/simple/main/cert.sh"
wget -O trojaan "https://raw.githubusercontent.com/${GitUser}/simple/main/menu/trojaan.sh"
wget -O xray-menu "https://raw.githubusercontent.com/${GitUser}/simple/main/menu/xray-menu.sh"
wget -O vless-menu "https://raw.githubusercontent.com/${GitUser}/simple/main/menu/vless-menu.sh"
wget -O vmess-menu "https://raw.githubusercontent.com/${GitUser}/simple/main/menu/vmess-menu.sh"
wget -O xp "https://raw.githubusercontent.com/${GitUser}/simple/main/xp.sh"
wget -O port-xray "https://raw.githubusercontent.com/${GitUser}/simple/main/change-port/port-xray.sh"
wget -O themes "https://raw.githubusercontent.com/${GitUser}/simple/main/menu/themes.sh"
#wget -O autobackup "https://raw.githubusercontent.com/${GitUser}/simple/main/system/backupBot.sh"
wget -O backup "https://raw.githubusercontent.com/${GitUser}/simple/main/system/backup.sh"
#wget -O bckp "https://raw.githubusercontent.com/${GitUser}/simple/main/system/bckp.sh"
wget -O restore "https://raw.githubusercontent.com/${GitUser}/simple/main/system/restore.sh"
wget -O add-host "https://raw.githubusercontent.com/${GitUser}/simple/main/system/add-host.sh"
wget -O about "https://raw.githubusercontent.com/${GitUser}/simple/main/system/about.sh"
wget -O add-ssh "https://raw.githubusercontent.com/${GitUser}/simple/main/add-user/add-ssh.sh"
wget -O trial "https://raw.githubusercontent.com/${GitUser}/simple/main/add-user/trial.sh"
wget -O del-ssh "https://raw.githubusercontent.com/${GitUser}/simple/main/delete-user/del-ssh.sh"
wget -O member "https://raw.githubusercontent.com/${GitUser}/simple/main/member.sh"
wget -O delete "https://raw.githubusercontent.com/${GitUser}/simple/main/delete-user/delete.sh"
wget -O cek-ssh "https://raw.githubusercontent.com/${GitUser}/simple/main/cek-user/cek-ssh.sh"
wget -O restart "https://raw.githubusercontent.com/${GitUser}/simple/main/system/restart.sh"
wget -O speedtest "https://raw.githubusercontent.com/${GitUser}/simple/main/system/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/${GitUser}/simple/main/system/info.sh"
#wget -O ram "https://raw.githubusercontent.com/${GitUser}/simple/main/system/ram.sh"
wget -O renew-ssh "https://raw.githubusercontent.com/${GitUser}/simple/main/renew-user/renew-ssh.sh"
wget -O autokill "https://raw.githubusercontent.com/${GitUser}/simple/main/autokill.sh"
wget -O ceklim "https://raw.githubusercontent.com/${GitUser}/simple/main/cek-user/ceklim.sh"
wget -O tendang "https://raw.githubusercontent.com/${GitUser}/simple/main/tendang.sh"
wget -O clean-ram "https://raw.githubusercontent.com/${GitUser}/simple/main/clean-ram.sh"
wget -O port-ovpn "https://raw.githubusercontent.com/${GitUser}/simple/main/change-port/port-ovpn.sh"
wget -O port-ssl "https://raw.githubusercontent.com/${GitUser}/simple/main/change-port/port-ssl.sh"
wget -O port-squid "https://raw.githubusercontent.com/${GitUser}/simple/main/change-port/port-squid.sh"
wget -O port-websocket "https://raw.githubusercontent.com/${GitUser}/simple/main/change-port/port-websocket.sh"
#wget -O wbmn "https://raw.githubusercontent.com/${GitUser}/simple/main/webmin.sh"
#wget -O kernel-updt "https://raw.githubusercontent.com/${GitUser}/simple/main/kernel.sh"
wget -O user-list "https://raw.githubusercontent.com/${GitUser}/simple/main/more-option/user-list.sh"
wget -O user-lock "https://raw.githubusercontent.com/${GitUser}/simple/main/more-option/user-lock.sh"
wget -O user-unlock "https://raw.githubusercontent.com/${GitUser}/simple/main/more-option/user-unlock.sh"
wget -O user-password "https://raw.githubusercontent.com/${GitUser}/simple/main/more-option/user-password.sh"
wget -O antitorrent "https://raw.githubusercontent.com/${GitUser}/simple/main/more-option/antitorrent.sh"
wget -O cfa "https://raw.githubusercontent.com/${GitUser}/simple/main/cloud/cfa.sh"
wget -O cfd "https://raw.githubusercontent.com/${GitUser}/simple/main/cloud/cfd.sh"
wget -O cfp "https://raw.githubusercontent.com/${GitUser}/simple/main/cloud/cfp.sh"
#wget -O swap "https://raw.githubusercontent.com/${GitUser}/simple/main/swapkvm.sh"
wget -O check-sc "https://raw.githubusercontent.com/${GitUser}/simple/main/system/running.sh"
wget -O ssh "https://raw.githubusercontent.com/${GitUser}/simple/main/menu/ssh.sh"
wget -O autoreboot "https://raw.githubusercontent.com/${GitUser}/simple/main/system/autoreboot.sh"
#wget -O bbr "https://raw.githubusercontent.com/${GitUser}/simple/main/system/bbr.sh"
wget -O port-ohp "https://raw.githubusercontent.com/${GitUser}/simple/main/change-port/port-ohp.sh"
#wget -O panel-domain "https://raw.githubusercontent.com/${GitUser}/simple/main/menu/panel-domain.sh"
wget -O dns "https://raw.githubusercontent.com/${GitUser}/simple/main/system/dns.sh"
wget -O nf "https://raw.githubusercontent.com/${GitUser}/simple/main/system/nf.sh"
chmod +x update
chmod +x run-update
chmod +x message-ssh
chmod +x change-port
chmod +x system
chmod +x menu
chmod +x add-host
chmod +x check-sc
chmod +x certv2ray
chmod +x trojaan
chmod +x xray-menu
chmod +x vless-menu
chmod +x vmess-menu
chmod +x xp
chmod +x port-xray
chmod +x themes
#chmod +x autobackup
chmod +x backup
#chmod +x bckp
chmod +x restore
chmod +x add-host
chmod +x about
chmod +x add-ssh
chmod +x trial
chmod +x del-ssh
chmod +x member
chmod +x delete
chmod +x cek-ssh
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x renew-ssh
chmod +x autokill
chmod +x ceklim
chmod +x tendang
chmod +x clean-ram
chmod +x port-ovpn
chmod +x port-ssl
chmod +x port-squid
chmod +x port-websocket
chmod +x user-list
chmod +x user-lock
chmod +x user-unlock
chmod +x user-password
chmod +x antitorrent
chmod +x cfa
chmod +x cfd
chmod +x cfp
chmod +x check-sc
chmod +x ssh
chmod +x autoreboot
chmod +x port-ohp
chmod +x dns
chmod +x nf
clear
echo -e ""
echo -e "\e[0;32mDownloaded successfully!\e[0m"
echo ""
ver=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf )
sleep 1
echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
echo ""
sleep 2
echo -e "\e[0;32mPatching... OK!\e[0m"
sleep 1
echo ""
echo -e "\e[0;32mSucces Update Script For New Version\e[0m"
cd
echo "$ver" > /home/ver
clear
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                   \e[$box SCRIPT UPDATED\e[30m                    \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo ""
read -n 1 -s -r -p "            Press any key to back on menu"
menu
;;
2)
clear
update
;;
3)
clear
system
;;
*)
clear
echo -e "\e[1;31mPlease Enter Option 1-2 or x & y Only..,Try again, Thank You..\e[0m"
sleep 1
run-update
;;
esac
