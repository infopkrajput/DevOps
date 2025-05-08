#!/bin/bash

# install useful softwares
sudo yum install wget unzip httpd -y

# make directory for downloading
mkdir -p /tmp/website_files

cd /tmp/website_files

wget -O template.zip https://www.tooplate.com/zip-templates/2134_gotto_job.zip

unzip template.zip

rm template.zip

sudo mv */* /var/www/html/
sudo systemctl start httpd
sudo systemctl enable httpd
