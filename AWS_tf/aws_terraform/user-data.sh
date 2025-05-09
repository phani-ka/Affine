
#!/bin/bash
sudo yum update -y
sudo yum install -y nginx
#sudo mkdir -p /var/www/html
#sudo chmod 0777 /var/www/html
echo "<h1>dev-server</h1>" >> /var/www/html/index.html
sudo systemctl start nginx
sudo systemctl enable nginx
