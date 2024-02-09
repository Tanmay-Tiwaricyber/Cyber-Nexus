#!/bin/bash

# CyberNexus - Automated Kali Linux Installer for Termux
# Developer - Silent Programmer 
# Banner
echo " ██████╗██╗   ██╗██████╗ ███████╗██████╗     ███╗   ██╗███████╗██╗  ██╗██╗   ██╗███████╗"
echo "██╔════╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗    ████╗  ██║██╔════╝╚██╗██╔╝██║   ██║██╔════╝"
echo "██║      ╚████╔╝ ██████╔╝█████╗  ██████╔╝    ██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║███████╗"
echo "██║       ╚██╔╝  ██╔══██╗██╔══╝  ██╔══██╗    ██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║╚════██║"
echo "╚██████╗   ██║   ██████╔╝███████╗██║  ██║    ██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝███████║"
echo " ╚═════╝   ╚═╝   ╚═════╝ ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝"
echo "-----------------------------Developer - Silent Programmer------------------------------"
# Function to check if Termux is installed
check_termux() {
    if [ ! -d "$HOME/.termux" ]; then
        echo "Termux is not installed. Please install Termux from the Play Store."
        exit 1
    fi
}

# Function to install required packages in Termux
install_packages() {
    echo "Installing required packages..."
    pkg install wget proot tar -y
}

# Function to download and extract the Kali Linux rootfs
download_kali_rootfs() {
    echo "Downloading Kali Linux rootfs..."
    wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Kali/armhf/kali-rootfs-armhf.tar.xz -O kali-rootfs.tar.xz
    echo "Extracting Kali Linux rootfs..."
    proot --link2symlink tar -xf kali-rootfs.tar.xz
    rm kali-rootfs.tar.xz
}

# Function to configure Kali Linux in Termux
configure_kali() {
    echo "Configuring Kali Linux in Termux..."
    echo "alias startkali='proot --link2symlink -0 -r $PWD/kali-rootfs -b /dev -b /proc -b /sys -w /root /usr/bin/env -i HOME=/root PATH=/bin:/sbin:/usr/bin:/usr/sbin /bin/bash'" >> "$HOME/.bashrc"
    echo "Kali Linux is installed. Run 'startkali' command to start Kali Linux in Termux."
}

# Main function
main() {
    check_termux
    install_packages
    download_kali_rootfs
    configure_kali
}

# Execute main function
main
