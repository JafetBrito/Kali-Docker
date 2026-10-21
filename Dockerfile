# 1. IMAGEN BASE
FROM kalilinux/kali-rolling

# 2. HERRAMIENTAS, INTERFAZ GRÁFICA (XFCE), NAVEGADOR Y VNC
RUN apt update && DEBIAN_FRONTEND=noninteractive apt -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
    kali-linux-core openvpn nmap gobuster sqlmap john metasploit-framework wordlists \
    wget curl iputils-ping net-tools iproute2 \
    xfce4 xfce4-terminal tightvncserver novnc websockify dbus-x11 firefox-esr \
    figlet fastfetch cmatrix lolcat && \
    apt clean

# 3. PREPARAR DICCIONARIOS
RUN gzip -d /usr/share/wordlists/rockyou.txt.gz || true

# 4. CONFIGURAR PRIVACIDAD (Ocultar IP Local)
RUN mkdir -p ~/.config/fastfetch && fastfetch --gen-config && \
    sed -i '/"localip"/d' ~/.config/fastfetch/config.jsonc || true

# 5. CONFIGURAR CONTRASEÑA PARA LA PANTALLA VIRTUAL (Contraseña: kali)
RUN mkdir ~/.vnc && echo "kali" | vncpasswd -f > ~/.vnc/passwd && chmod 600 ~/.vnc/passwd

# 6. CONFIGURACIÓN VISUAL DE LA TERMINAL (.bashrc)
# Agregamos 2>/dev/null a fastfetch para ocultar las advertencias gráficas
RUN echo 'export PATH=$PATH:/usr/games' >> ~/.bashrc && \
    echo 'fastfetch 2>/dev/null' >> ~/.bashrc && \
    echo 'figlet -f small -- "-Jafet Brito -" | lolcat' >> ~/.bashrc && \
    echo 'figlet -f small -- "-Ingenieria de la realidad-" | lolcat' >> ~/.bashrc && \
    echo 'alias oliver="echo '\''Miau. Hack the planet.'\'' | lolcat && sleep 1 && cmatrix -C green"' >> ~/.bashrc

# 7. SCRIPT AUTOMÁTICO DE ARRANQUE (Enciende el escritorio en el puerto 8080)
RUN echo '#!/bin/bash\nUSER=root vncserver :1 -geometry 1280x720 -depth 24\nwebsockify --web=/usr/share/novnc/ 8080 localhost:5901 &\ntail -f /dev/null' > /start.sh && chmod +x /start.sh

WORKDIR /workspace

# Inicia la interfaz web al encender el contenedor
CMD ["/start.sh"]