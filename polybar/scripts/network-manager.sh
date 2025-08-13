#!/bin/bash

# Obtiene el nombre de la interfaz de red activa
interface=$(ip route | awk '/default/ { print $5 ; exit }')

if [ "$interface" = "enp2s0" ]; then
	# Para la conexión a Ethernet
	ip_address=$(ip -4 -o addr show enp2s0 | awk '{print $4}' | cut -d/ -f1)
	echo "%{F#FFFFFF}󰈀 $ip_address"
elif [ "$interface" = "wlo1" ]; then
	# Para la conexión Wi-Fi
	ssid=$(nmcli -t -f active,ssid dev wifi | grep '^sí|^yes' | cut -d':' -f2)
	echo "%{F#FFFFFF}  $ssid"
else
	# Sin conexión
	echo "%{F#FF0000}Desconectado"
fi
