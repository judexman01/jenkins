#!/bin/sh

sudo apt-get update -y

echo "install java"
sudo apt-get install openjdk-11-jdk -y


sudo ufw allow 8080
sudo ufw --force enable
echo "y" | sudo ufw enable
echo "install Jenkins"
sudo curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
sudo systemctl start jenkins.service
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
