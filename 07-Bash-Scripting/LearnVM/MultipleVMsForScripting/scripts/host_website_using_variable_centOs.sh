#!/bin/bash

# Variable declare
PACKAGES="wget unzip httpd git"
SERVICE="httpd"
URL="https://www.tooplate.com/zip-templates/2134_gotto_job.zip"
TEMP_DIR="/tmp/website_files"

# install useful softwares
sudo yum install $PACKAGES -y

# make directory for downloading
mkdir -p $TEMP_DIR

# changed to downloading directory
cd $TEMP_DIR

# Download file
wget -O template.zip $URL

# unzip downloaded file
unzip template.zip

# remove zip
rm template.zip

# move downloaded files and host
sudo mv */* /var/www/html/
sudo systemctl start $SERVICE
sudo systemctl enable $SERVICE
