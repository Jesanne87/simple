#wget https://github.com/${GitUser}/
GitUser="Jesanne87"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
# Valid Script
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
# Status Version
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
InfoD="Default Version ${Green_font_prefix}[ON]${Font_color_suffix}"
Info1="Version 1 ${Green_font_prefix}[ON]${Font_color_suffix}"
Info2="Version 2 ${Green_font_prefix}[ON]${Font_color_suffix}"
Info3="Version 3 ${Green_font_prefix}[ON]${Font_color_suffix}"
Info4="Version 4 ${Green_font_prefix}[ON]${Font_color_suffix}"
Info5="Custom Version ${Green_font_prefix}[ON]${Font_color_suffix}"
Error="Banner SSH ${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(cat /home/bannerssh)
function defaultv () {
rm -f /etc/issue.net
wget -O /etc/issue.net https://raw.githubusercontent.com/${GitUser}/menu/main/banner/bannersshDefault.conf && chmod +x /etc/issue.net
echo "0.1" > /home/bannerssh
clear
echo -e "Succesfully Use Default Version."
echo -e "\e[0;32mDone\e[0m"
echo -e " \e[1;31mReboot 3 Sec\e[0m"
sleep 3
reboot
}
function server_message_ssh1 () {
rm -f /etc/issue.net
wget -O /etc/issue.net https://raw.githubusercontent.com/${GitUser}/menu/main/banner/bannerssh1.conf && chmod +x /etc/issue.net
echo "1" > /home/bannerssh
clear
echo -e "Succesfully Change Server Message Version 1 For SSH."
echo -e "\e[0;32mDone\e[0m"
echo -e " \e[1;31mReboot 3 Sec\e[0m"
sleep 3
reboot
}
function server_message_ssh2 () {
rm -f /etc/issue.net
wget -O /etc/issue.net https://raw.githubusercontent.com/${GitUser}/menu/main/banner/bannerssh2.conf && chmod +x /etc/issue.net
echo "2" > /home/bannerssh
clear
echo -e "Succesfully Change Server Message Version 2 For SSH."
echo -e "\e[0;32mDone\e[0m"
echo -e " \e[1;31mReboot 3 Sec\e[0m"
sleep 3
reboot
}
function server_message_ssh3 () {
rm -f /etc/issue.net
wget -O /etc/issue.net https://raw.githubusercontent.com/${GitUser}/menu/main/banner/bannerssh3.conf && chmod +x /etc/issue.net
echo "3" > /home/bannerssh
clear
echo -e "Succesfully Change Server Message Version 3 For SSH."
echo -e "\e[0;32mDone\e[0m"
echo -e " \e[1;31mReboot 3 Sec\e[0m"
sleep 3
reboot
}
function server_message_ssh4 () {
rm -f /etc/issue.net
wget -O /etc/issue.net https://raw.githubusercontent.com/${GitUser}/menu/main/banner/bannerssh4.conf && chmod +x /etc/issue.net
echo "4" > /home/bannerssh
clear
echo -e "Succesfully Change Server Message Version 4 For SSH."
echo -e "\e[0;32mDone\e[0m"
echo -e " \e[1;31mReboot 3 Sec\e[0m"
sleep 3
reboot
}
function server_message_ssh5 () {
echo "5" > /home/bannerssh
nano /etc/issue.net
echo -e "Succesfully Customize Server Message For SSH."
echo -e "\e[0;32mDone\e[0m"
echo -e " \e[1;31mReboot 3 Sec\e[0m"
sleep 3
reboot
}
function stop () {
rm -f /etc/issue.net
sleep 0.5
echo > /home/bannerssh
echo -e "Server Message SSH has been successfully Turn Off."
echo -e "\e[0;32mDone\e[0m"
echo -e " \e[1;31mReboot 3 Sec\e[0m"
sleep 3
reboot
}

#Status Server Message
if [[ "$cek" = "0.1" ]]; then
sts="${InfoD}"
elif [[ "$cek" = "1" ]]; then
sts="${Info1}"
elif [[ "$cek" = "2" ]]; then
sts="${Info2}"
elif [[ "$cek" = "3" ]]; then
sts="${Info3}"
elif [[ "$cek" = "4" ]]; then
sts="${Info4}"
elif [[ "$cek" = "5" ]]; then
sts="${Info5}"
else
sts="${Error}"
fi
clear
echo ""
figlet " BANNER  SSH" | lolcat
echo -e "\e[$line┌──────────────────────────────────────────────────────┐\e[m"
echo -e "\e[$line│           \e[$box BANNER/SERVER MESSAGE FOR SSH\e[30m             \e[$line│\e[m"
echo -e "\e[$line└──────────────────────────────────────────────────────┘\e[m"
echo -e "    \e[0;33mSTATUS BANNER\e[0;36m(USED) \e[0;33m:\e[0m $sts"
echo -e ""
echo -e "      [\e[$number 01${NC}]\e[$below • Set Default Banner\e[m"
echo -e "      [\e[$number 02${NC}]\e[$below • Set Banner Version 1\e[m"
echo -e "      [\e[$number 03${NC}]\e[$below • Set Banner Version 2\e[m"
echo -e "      [\e[$number 04${NC}]\e[$below • Set Banner Version 3\e[m"
echo -e "      [\e[$number 05${NC}]\e[$below • Set Banner Version 4\e[m"
echo -e "      [\e[$number 06${NC}]\e[$below • Edit Banner SSH\e[m"
echo -e "      [\e[$number 07${NC}]\e[$below • Turn Off Banner SSH\e[m"
echo -e ""
echo -e "   --------------------------------------------------------- ${NC}" | lolcat
echo -e "      \e[0;36mx.\e[0m Back To Update Script Menu"
echo -e "      \e[0;36my.\e[0m Back To system Menu"
echo -e ""
read -rp "  Please Enter 1-7 or x & y : " -e num
if [[ "$num" = "1" ]]; then
defaultv
elif [[ "$num" = "2" ]]; then
server_message_ssh1
elif [[ "$num" = "3" ]]; then
server_message_ssh2
elif [[ "$num" = "4" ]]; then
server_message_ssh3
elif [[ "$num" = "5" ]]; then
server_message_ssh4
elif [[ "$num" = "6" ]]; then
server_message_ssh5
elif [[ "$num" = "8" ]]; then
stop
elif [[ "$num" = "x" ]]; then
update
elif [[ "$num" = "y" ]]; then
system
else
echo -e "\e[1;31mYou Entered The Wrong Number, Please Try Again!\e[0m"
sleep 1
message-ssh
fi
