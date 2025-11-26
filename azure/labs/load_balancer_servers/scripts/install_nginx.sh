#!/bin/bash

# update all packages
apt-get update -y

# install nginx
apt-get install -y nginx

# remove index.nginx-debian.html
rm -f /var/www/html/index.nginx-debian.html

# change the port to 8090
# sed -i 's/listen 80 default_server;/listen 8090 default_server;/g' /etc/nginx/sites-available/default
# sed -i 's/listen \[::\]:80 default_server;/listen [::]:8090 default_server;/g' /etc/nginx/sites-available/default

# create new custom index.html with styled content
cat > /var/www/html/index.html <<EOF
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Static Page</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      color: #333;
    }

    .container {
      background: white;
      border-radius: 20px;
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
      padding: 60px 40px;
      text-align: center;
      max-width: 600px;
      width: 90%;
      animation: fadeIn 0.8s ease-in;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
        transform: translateY(-20px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    h1 {
      font-size: 2.5em;
      margin-bottom: 20px;
      color: #667eea;
      font-weight: 700;
    }

    .hostname {
      font-size: 1.8em;
      color: #764ba2;
      font-weight: 600;
      margin: 30px 0;
      padding: 20px;
      background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
      border-radius: 10px;
      border-left: 5px solid #667eea;
    }

    .info {
      margin-top: 40px;
      padding-top: 30px;
      border-top: 2px solid #e0e0e0;
      color: #666;
      font-size: 0.9em;
    }

    .icon {
      font-size: 4em;
      margin-bottom: 20px;
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="icon">🚀</div>
    <h1>@adejonghm</h1>
    <p style="font-size: 1.2em; color: #666; margin-bottom: 20px;">
      This page is being served from:
    </p>
    <div class="hostname">$(hostname)</div>
    <div class="info">
      <p>Nginx is running on port 8090</p>
      <p style="margin-top: 10px;">Powered by Azure Infrastructure</p>
    </div>
  </div>
</body>
</html>
EOF

# start the service
systemctl enable nginx
systemctl start nginx
