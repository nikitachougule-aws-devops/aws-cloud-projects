#!/bin/bash

# Update system packages
dnf update -y

# Install Apache web server
dnf install -y httpd

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Create a sample web page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Terraform AWS Infrastructure</title>
</head>
<body style="font-family: Arial; text-align: center; margin-top: 50px;">
    <h1>Terraform Infrastructure Successfully Deployed!</h1>
    <h2>Amazon EC2 + Apache</h2>
    <p>This web server was provisioned using Terraform.</p>
</body>
</html>
EOF