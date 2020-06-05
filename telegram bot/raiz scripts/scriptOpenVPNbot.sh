#!/bin/bash

# Envia mensajes utilizando TELEGRAM
# para alertar al administrador de las conexiones

MYDATE=$(/bin/date +'%Y/%m/%d %H:%M:%S')
userId=
apiToken=

	if [ "$script_type" = "client-connect" ]; then
	    curl -s -X POST "https://api.telegram.org/bot$apiToken/sendMessage" -d chat_id=$userId -d text="$MYDATE Conexion VPN establecida. Usuario $common_name con direccion IP externa $trusted_ip obtiene direccion IP interna VPN $ifconfig_pool_remote_ip"
	
	elif [ "$script_type" = "client-disconnect" ]; then
	    curl -s -X POST "https://api.telegram.org/bot$apiToken/sendMessage" -d chat_id=$userId -d text="$MYDATE FIN Conexion VPN. Usuario $common_name con direccion IP externa $trusted_ip libera direccion IP interna VPN $ifconfig_pool_remote_ip"
	fi
	exit 0

# BOT TELEGRAM OPENVPN
# Author: Alex Aliaga
# Re-edicion: Ruben Blanco
# Fecha: 30 Abril 2020

