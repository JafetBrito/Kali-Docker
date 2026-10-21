# 🚀 TryHackMe AttackBox en Docker

Este repositorio contiene la configuración automatizada para desplegar tu propia **AttackBox gratuita, infinita y con interfaz gráfica** ejecutándose en un contenedor de Docker. Incluye Kali Linux, entorno de escritorio XFCE, navegador web integrado y las principales herramientas de pentesting preinstaladas.

## 📋 1. Requisitos Previos (Instalar Docker)

Antes de empezar, necesitas tener Docker instalado en tu computadora.

**Para Windows:**
1. Descarga e instala [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. Asegúrate de tener habilitado **WSL 2** (Windows Subsystem for Linux) durante la instalación.
3. Abre Docker Desktop y asegúrate de que el motor esté en ejecución (icono verde en la barra de tareas).

**Para Linux (Debian/Ubuntu/Kali):**
Abre tu terminal y ejecuta:
```bash
sudo apt update
sudo apt install docker.io docker-compose -y
sudo systemctl enable docker --now
sudo usermod -aG docker $USER
(Cierra sesión y vuelve a entrar para que los permisos apliquen).

⚙️ 2. Preparación del Entorno
Descarga este repositorio (o clónalo usando git clone).

Ve a la página de TryHackMe, descarga tu archivo de configuración VPN (.ovpn).

Mueve ese archivo .ovpn directamente dentro de la carpeta workspace de este proyecto.

🛠️ 3. Construcción y Despliegue
Abre tu terminal en la carpeta principal de este proyecto (donde se encuentra el archivo docker-compose.yml) y ejecuta:

Bash
docker compose up -d --build
Nota: La primera vez que ejecutes este comando, Docker descargará el sistema operativo y construirá la interfaz gráfica. Esto puede tardar entre 10 y 15 minutos dependiendo de tu conexión a internet. Las siguientes veces iniciará en menos de 3 segundos.

🌐 4. Acceso a la Interfaz Gráfica
Una vez que la terminal indique que el contenedor está en ejecución:

Abre tu navegador web (Chrome, Edge, Firefox, etc.) en tu computadora.

Ingresa a la siguiente dirección: http://localhost:8080/vnc.html

Haz clic en el botón de Connect.

Ingresa la contraseña: kali

Ya estás dentro del escritorio virtual de Kali Linux.

🛡️ 5. Conectar la VPN a TryHackMe
Para enrutar tu AttackBox virtual a la red de TryHackMe:

Dentro del escritorio virtual en tu navegador, abre la terminal.

Ejecuta OpenVPN apuntando al archivo que dejaste en tu carpeta compartida:

Bash
openvpn --config /workspace/tu_archivo.ovpn &
(Asegúrate de cambiar tu_archivo.ovpn por el nombre real de tu archivo).

Presiona Enter, escribe ip a y verifica que exista la interfaz tun0.

Ya puedes usar el navegador Firefox interno de la AttackBox para visitar las IP de las máquinas víctimas.

🧹 6. Limpieza
Cuando termines tu laboratorio y quieras apagar el entorno para liberar memoria RAM y recursos de tu computadora, ejecuta:

Bash
docker compose down
