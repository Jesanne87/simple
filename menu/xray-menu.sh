#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : Geo Project
# (C) Copyright 2023
# =========================================
###########- COLOR CODE -##############
# // BANNER COLOUR
export banner_colour=$(cat /etc/banner)
# // TEXT ON BOX COLOUR
export box=$(cat /etc/box)
# // LINE COLOUR
export line=$(cat /etc/line)
# // TEXT COLOUR ON TOP
export text=$(cat /etc/text)
# // TEXT COLOUR BELOW
export below=$(cat /etc/below)
# // BACKGROUND TEXT COLOUR
export back_text=$(cat /etc/back)
# // NUMBER COLOUR
export number=$(cat /etc/number)
###########- END COLOR CODE -##########
clear
echo -e " ${COLOR1}╔══════════════════════════════════════════════════════╗${NC}"
echo -e " ${COLOR1}║               ${NC}${WH}»»»»[ XRAY PANEL ]««««                 ${COLOR1}║${NC}"
echo -e " ${COLOR1}╠══════════════════════════════════════════════════════╣${NC}" 
echo -e " ${COLOR1}║                                                      ║${NC}"
echo -e " ${COLOR1}║  ${NC}${WH}[${COLOR1}01${WH}]${COLOR1}• ${WH}${bold}Vless Panel     ${COLOR1}║${NC}"
echo -e " ${COLOR1}║  ${NC}${WH}[${COLOR1}02${WH}]${COLOR1}• ${WH}${bold}Vmess Panel          ${COLOR1}║${NC}"
echo -e " ${COLOR1}║  ${NC}${WH}[${COLOR1}03${WH}]${COLOR1}• ${WH}${bold}Trojan Panel                               ${COLOR1}║${NC}"
echo -e " ${COLOR1}║                                                      ║${NC}"
echo -e " ${COLOR1}╚══════════════════════════════════════════════════════╝${NC}" 
echo ""
echo -e "                 Press [ x ] To Go Main Menu "
echo -ne " ${bold}${GRN}Select menu ${NC}: "; read opt
case $opt in
01 | 1)vless-menu
;;
02 | 2)vmess-menu
;;
03 | 3)trojaan
;;
x | X)menu
;;
*)
echo " Tolong masukkan nombor yang betul!!"
xray-menu
;;
esac