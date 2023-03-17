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
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf | grep $version )
#Status Version
if [ $version = $new_version ]; then
sts="${Info2}"
else
sts="${Error}"
fi
clear
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                 \e[$box CHECK NEW UPDATE\e[30m                  \e[$line│\e[m"
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
read -p "Please Choose 1 or x & y : " option2
case $option2 in
1)
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/${GitUser}/version/main/version.conf | grep $version )
if [ $version = $new_version ]; then
clear
echo ""
echo -e "\e[1;31mChecking New Version, Please Wait...!\e[m"
sleep 3
clear
echo -e "\e[1;31mUpdate Not Available\e[m"
echo ""
clear
sleep 1
echo -e "\e[1;36mYou Have The Latest Version\e[m"
echo -e "\e[1;31mThankyou.\e[0m"
sleep 2
update
fi
clear
echo -e "\e[1;31mUpdate Available Now..\e[m"
echo -e ""
sleep 2
echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
sleep 2
clear
echo -e "\e[0;32mGetting New Version Script..\e[0m"
sleep 1
echo ""
# UPDATE RUN-UPDATE
cd /usr/bin
wget -O run-update "https://raw.githubusercontent.com/${GitUser}/lanjut/main/update/run-update.sh"
chmod +x run-update
# RUN UPDATE
echo ""
clear
echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 6
clear
echo ""
echo -e "\e[0;32mNew Version Downloading started!\e[0m"
sleep 2
cd /usr/bin
wget -O update "https://raw.githubusercontent.com/${GitUser}/lanjut/main/update/update.sh"
wget -O run-update "https://raw.githubusercontent.com/${GitUser}/lanjut/main/update/run-update.sh"
wget -O message-ssh "https://raw.githubusercontent.com/${GitUser}/lanjut/main/update/message-ssh.sh"
wget -O change-port "https://raw.githubusercontent.com/${GitUser}/lanjut/main/change.sh"
wget -O system "https://raw.githubusercontent.com/${GitUser}/lanjut/main/menu/system.sh"
wget -O menu "https://raw.githubusercontent.com/${GitUser}/lanjut/main/menu.sh"
wget -O add-host "https://raw.githubusercontent.com/${GitUser}/lanjut/main/system/add-host.sh"
wget -O check-sc "https://raw.githubusercontent.com/${GitUser}/lanjut/main/system/running.sh"
wget -O certv2ray "https://raw.githubusercontent.com/${GitUser}/lanjut/main/cert.sh"
wget -O trojaan "https://raw.githubusercontent.com/${GitUser}/lanjut/main/menu/trojaan.sh"
wget -O xraay "https://raw.githubusercontent.com/${GitUser}/lanjut/main/menu/xraay.sh"
wget -O xp "https://raw.githubusercontent.com/${GitUser}/lanjut/main/xp.sh"
wget -O port-xray "https://raw.githubusercontent.com/${GitUser}/lanjut/main/change-port/port-xray.sh"
wget -O themes "https://raw.githubusercontent.com/${GitUser}/lanjut/main/menu/themes.sh"
#wget -O autobackup "https://raw.githubusercontent.com/${GitUser}/lanjut/main/system/backupBot.sh"
wget -O backup "https://raw.githubusercontent.com/${GitUser}/lanjut/main/system/backup.sh"
#wget -O bckp "https://raw.githubusercontent.com/${GitUser}/lanjut/main/system/bckp.sh"
wget -O restore "https://raw.githubusercontent.com/${GitUser}/lanjut/main/system/restore.sh"
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
chmod +x xraay
chmod +x xp
chmod +x port-xray
chmod +x themes
#chmod +x autobackup
chmod +x backup
#chmod +x bckp
chmod +x restore
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
rm -f update.sh
clear
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│                 \e[$box SCRIPT UPDATED\e[30m                  \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
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
sleep 2
run-update
;;
esac
