#!/bin/bash

echo -e "\e[1;32m[+] TAREA 1: CONECTAR LA MATRIX (VPN)\e[0m"
echo "1. Asegúrate de tener tu archivo .ovpn en la carpeta workspace compartida."
echo "2. Ejecuta el siguiente comando para iniciar la conexión:"
echo -e "\e[1;33mopenvpn --config /workspace/tu_archivo.ovpn &\e[0m"
echo "3. Presiona Enter, escribe 'ip a' y verifica que exista la interfaz tun0."