#!/bin/bash

# =====================================================================
# BYPASS SYSADMIN: Puente dinámico para el SquashFS de Calamares
# =====================================================================
# Crear la carpeta contenedora en la RAM del entorno live
mkdir -p /run/archiso/lumina_source/x86_64/

# Detectar si quedó en bootmnt (USB/virt-manager) o img_dev (QEMU CLI/ISO)
if [ -f "/run/archiso/bootmnt/lumina/x86_64/airootfs.sfs" ]; then
    ln -sf /run/archiso/bootmnt/lumina/x86_64/airootfs.sfs /run/archiso/lumina_source/x86_64/airootfs.sfs
elif [ -f "/run/archiso/img_dev/lumina/x86_64/airootfs.sfs" ]; then
    ln -sf /run/archiso/img_dev/lumina/x86_64/airootfs.sfs /run/archiso/lumina_source/x86_64/airootfs.sfs
fi
# =====================================================================

# Configuración del escritorio del usuario
if [ "$USER" = "luminauser" ]; then
    mkdir -p "$HOME/Desktop"
    if [ ! -f "$HOME/Desktop/instalar-lumina.desktop" ]; then
        cp /usr/share/applications/instalar-lumina.desktop "$HOME/Desktop/"
        chmod +x "$HOME/Desktop/instalar-lumina.desktop"
    fi
fi
