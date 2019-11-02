#!/bin/bash

set -e

if [ "$#" -ne 3 ]; then
	echo "usage: connect_wifi.sh <iface> <ssid> <passphrase>"
	exit 1
fi


echo "iface $1 inet dhcp" >> /etc/network/interfaces

wpa_passphrase $2 $3  > /etc/wpa_supplicant/$2

wpa_supplicant -B -i $1 -c /etc/wpa_supplicant/$2

ifup $1


