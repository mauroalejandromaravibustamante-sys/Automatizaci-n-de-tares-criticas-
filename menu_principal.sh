#!/bin/bash

while true; do
    clear
    echo "========================================="
    echo "    SISTEMA DE ADMINISTRACIÓN DE TAREAS TI"
    echo "========================================="
    echo "1. Ejecutar Copia de Seguridad Diaria"
    echo "2. Ejecutar Monitoreo de Logs"
    echo "3. Gestión de Usuarios y Permisos"
    echo "4. Salir"
    echo "========================================="
    read -p "Seleccione una opción [1-4]: " opcion

    case $opcion in
        1)
            echo "Iniciando script de Backup..."
            ./01_backup.sh
            read -p "Presione [Enter] para continuar..."
            ;;
        2)
            echo "Iniciando Monitoreo de Logs..."
            ./02_monitor_logs.sh
            read -p "Presione [Enter] para continuar..."
            ;;
        3)
            echo "Iniciando Gestión de Usuarios..."
            sudo ./03_gestion_usuarios.sh
            read -p "Presione [Enter] para continuar..."
            ;;
        4)
            echo "Saliendo del sistema. ¡Hasta pronto!"
            exit 0
            ;;
        *)
            echo "Opción no válida. Por favor, intente de nuevo."
            read -p "Presione [Enter] para continuar..."
            ;;
    esac
done
