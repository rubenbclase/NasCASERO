#!/bin/bash

####################################
# NOTIFICACIONES INICIO SESION SSH #
####################################

# credenciales del bot
USERID=
KEY=

URL="https://api.telegram.org/bot${KEY}/sendMessage"
FECHA="$(date "+%d %b %Y %H:%M")"
CURL=/usr/bin/curl
LOG="/var/log/telegram.log"
REGISTRO="[${FECHA} pam_type ${PAM_TYPE}: pam_user ${PAM_USER} from ${PAM_RHOST}"

if [ ! -f ${LOG} ]; then
    touch ${LOG}
    chown root.adm ${LOG}
    chmod 0640 ${LOG}
fi

echo ${REGISTRO} >> ${LOG}

if  [ -n "$PAM_RHOST" ]; then
   MESSAGE="${PAM_TYPE} desde DIRECCION IP ${PAM_RHOST} con usuario ${PAM_USER} en fecha y hora ${FECHA}"
   $CURL -s -d "chat_id=$USERID&disable_web_page_preview=1&text=$MESSAGE" $URL > /tmp/curl
fi

exit 0

# BOT TELEGRAM OPENVPN
# Author: @nuria_imeq
# Re-edicion mensaje español: Ruben Blanco
# Fecha: 30 Abril 2020