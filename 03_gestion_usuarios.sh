#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "ERROR: Este script debe ser ejecutado como root (sudo)."
    exit 1
fi

# Definir roles y crear grupos si no existen
ROLES=("admin_sys" "desarrollador" "auditor")
for rol in "${ROLES[@]}"; do
    if ! getent group "$rol" > /dev/null 2>&1; then
        groupadd "$rol"
        echo "Grupo '$rol' creado."
    fi
done

read -p "Ingrese el nombre del nuevo usuario: " USUARIO
if id "$USUARIO" &>/dev/null; then
    echo "ERROR: El usuario '$USUARIO' ya existe."
    exit 1
fi

echo "Seleccione el rol para $USUARIO:"
echo "1) admin_sys (Acceso a sudo)"
echo "2) desarrollador (Acceso a proyectos)"
echo "3) auditor (Solo lectura de logs)"
read -p "Opción [1-3]: " OPCION_ROL

case $OPCION_ROL in
    1) GRUPO="admin_sys";;
    2) GRUPO="desarrollador";;
    3) GRUPO="auditor";;
    *) echo "Opción inválida."; exit 1;;
esac

useradd -m -g "$GRUPO" -s /bin/bash "$USUARIO"
echo "Usuario $USUARIO creado exitosamente en el grupo $GRUPO."

# Asignación de permisos específicos por rol
case $GRUPO in
    admin_sys)
        usermod -aG sudo "$USUARIO" # Debian/Ubuntu (En CentOS/RHEL usa 'wheel')
        ;;
    desarrollador)
        # Ejemplo: Crear carpeta compartida si no existe y dar permisos
        mkdir -p /opt/proyectos
        chown -R root:desarrollador /opt/proyectos
        chmod -R 770 /opt/proyectos
        ;;
    auditor)
        # El auditor suele necesitar ser agregado a grupos como adm o syslog para leer logs
        usermod -aG adm "$USUARIO"
        ;;
esac

echo "$USUARIO:Temporal123!" | chpasswd
passwd -e "$USUARIO" > /dev/null

echo "Proceso finalizado. Contraseña temporal: Temporal123!"
echo "El usuario deberá cambiar su contraseña en el primer inicio de sesión."
