#!/bin/bash

yum -y update && yum -y upgrade
yum -y install httpd
echo "Hola soy $USER y estoy en $(hostname -f)" > /var/www/html/index.html
systemctl enable httpd
systemctl start httpd