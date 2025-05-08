#!/bin/bash

# Detect the OS
OS_ID=$(grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')

# Set package manager and web server based on OS
case $OS_ID in
    ubuntu)
        PKG_MANAGER="apt"
        WEB_SERVER="apache2"
        ;;
    centos)
        PKG_MANAGER="yum"
        WEB_SERVER="httpd"
        ;;
    *)
        echo "Unsupported OS: $OS_ID"
        exit 1
        ;;
esac

# Update package lists (for Ubuntu)
if [ "$OS_ID" = "ubuntu" ]; then
    sudo apt update -y
fi

# Install required packages
sudo $PKG_MANAGER install wget unzip $WEB_SERVER -y

# Setup website files
TMP_DIR="/tmp/website_files"
mkdir -p $TMP_DIR
cd $TMP_DIR

wget -O template.zip https://www.tooplate.com/zip-templates/2134_gotto_job.zip
unzip template.zip
rm template.zip

# Move content to web directory
sudo mv */* /var/www/html/

# Start and enable web server
sudo systemctl start $WEB_SERVER
sudo systemctl enable $WEB_SERVER

echo "Installation complete! Server should be running at http://$(curl -s ifconfig.me)"
