#!/bin/bash

# update all packages
apt-get update -y

# install nginx
apt-get install -y nginx

# change nginx to listen on port 8090 instead of 80
sed -i 's/listen 80 default_server;/listen 8090 default_server;/g' /etc/nginx/sites-available/default
sed -i 's/listen \[::\]:80 default_server;/listen [::]:8090 default_server;/g' /etc/nginx/sites-available/default

# remove index.nginx-debian.html
rm -f /var/www/html/index.nginx-debian.html

# create new custom index.html
echo "<h1>Hello World from: $(hostname)</h1>" > /var/www/html/index.html

# start the service
systemctl enable nginx
systemctl start nginx