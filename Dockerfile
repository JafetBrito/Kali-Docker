# 1. IMAGEN BASE
FROM kalilinux/kali-rolling

# 2. ACTUALIZACIÓN E INSTALACIÓN DE HERRAMIENTAS
RUN apt update && DEBIAN_FRONTEND=noninteractive apt -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt install -y \
    kali-linux-core \
    openvpn \
    nmap \
    gobuster \
    sqlmap \
    john \
    metasploit-framework \
    wordlists \
    tmux \
    wget \
    curl \
    iputils-ping \
    net-tools \
    iproute2 \
    figlet \
    fastfetch \
    cmatrix \
    lolcat && \
    apt clean

# 3. PREPARAR DICCIONARIOS
RUN gzip -d /usr/share/wordlists/rockyou.txt.gz || true

# 4. CONFIGURACIÓN VISUAL DEL ENTORNO (.bashrc)
RUN echo 'export PATH=$PATH:/usr/games' >> ~/.bashrc && \
    echo 'fastfetch' >> ~/.bashrc && \
    echo 'figlet -f small -- "-Jafet Brito -" | lolcat' >> ~/.bashrc && \
    echo 'figlet -f small -- "-Ingenieria de la realidad-" | lolcat' >> ~/.bashrc && \
    echo 'echo -e "\nEscribe \e[1;33mtarea1\e[0m para ver tu primera misión.\n"' >> ~/.bashrc && \
    echo 'alias oliver="echo '\''Miau. Hack the planet.'\'' | lolcat && sleep 1 && cmatrix -C green"' >> ~/.bashrc

# 5. ENTORNO DE TRABAJO
WORKDIR /workspace

# 6. COMANDO DE INICIO
CMD ["/bin/bash"]