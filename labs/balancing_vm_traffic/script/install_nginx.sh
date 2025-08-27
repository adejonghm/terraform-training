#!/bin/bash

# update all packages
apt-get update -y

# install nginx
apt-get install -y nginx

# remove index.nginx-debian.html
rm -f /var/www/html/index.nginx-debian.html

# create new custom index.html
echo "<h1>Hello World from $(hostname)</h1>" > /var/www/html/index.html

# start the service
systemctl enable nginx
systemctl start nginx